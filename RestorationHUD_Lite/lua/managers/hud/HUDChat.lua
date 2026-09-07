function HUDChat:_create_input_panel()
	self._input_panel = self._panel:panel({
		name = "input_panel",
		h = 24,
		alpha = 0,
		x = 0,
		layer = 1,
		w = self._panel_width
	})

	self._input_panel:rect({
		name = "focus_indicator",
		layer = 0,
		visible = false,
		color = Color.white:with_alpha(0.2)
	})

	local say = self._input_panel:text({
		y = 0,
		name = "say",
		vertical = "center",
		hvertical = "center",
		align = "left",
		blend_mode = "normal",
		halign = "left",
		x = 0,
		layer = 1,
		text = utf8.to_upper(managers.localization:text("debug_chat_say")),
		font = "fonts/font_small_shadow_mf",
		font_size = 14,
		color = Color.white
	})
	local _, _, w, h = say:text_rect()

	say:set_size(w, self._input_panel:h())

	local input_text = self._input_panel:text({
		y = 0,
		name = "input_text",
		vertical = "center",
		wrap = true,
		align = "left",
		blend_mode = "normal",
		hvertical = "center",
		text = "",
		word_wrap = false,
		halign = "left",
		x = 0,
		layer = 1,
		font = "fonts/font_small_shadow_mf",
		font_size = 14,
		color = Color.white
	})
	local caret = self._input_panel:rect({
		name = "caret",
		h = 0,
		y = 0,
		w = 0,
		x = 0,
		layer = 2,
		color = Color(0.05, 1, 1, 1)
	})

	if _G.IS_VR then
		say:set_visible(false)
		caret:set_visible(false)
	end

	self._input_panel:gradient({
		blend_mode = "sub",
		name = "input_bg",
		valign = "grow",
		layer = -1,
		gradient_points = {
			0,
			Color.white:with_alpha(0),
			0.2,
			Color.white:with_alpha(0.25),
			1,
			Color.white:with_alpha(0)
		},
		h = self._input_panel:h()
	})
end

function HUDChat:receive_message(name, message, color, icon)
	local output_panel = self._panel:child("output_panel")
	local scroll_panel = output_panel:child("scroll_panel")
	local len = utf8.len(name) + 1
	local x = 0
	local icon_bitmap = nil

	if icon then
		local icon_texture, icon_texture_rect = tweak_data.hud_icons:get_icon_data(icon)
		icon_bitmap = scroll_panel:bitmap({
			y = 1,
			texture = icon_texture,
			texture_rect = icon_texture_rect,
			color = color
		})
		x = icon_bitmap:right()
	end

	local line = scroll_panel:text({
		halign = "left",
		vertical = "top",
		hvertical = "top",
		wrap = true,
		align = "left",
		blend_mode = "normal",
		word_wrap = true,
		y = 0,
		layer = 0,
		text = utf8.to_upper(name) .. ": " .. message,
		font = "fonts/font_small_shadow_mf",
		font_size = 14,
		x = x,
		color = color
	})
	local total_len = utf8.len(line:text())

	line:set_range_color(0, len, color)
	line:set_range_color(len, total_len, Color.white)

	local _, _, w, h = line:text_rect()

	line:set_h(h)
	table.insert(self._lines, {
		line,
		icon_bitmap
	})
	line:set_kern(line:kern())
	self:_layout_output_panel()

	if not self._focus then
		scroll_panel:set_bottom(output_panel:h())
		self:set_scroll_indicators()
	end

	if not self._focus then
		local output_panel = self._panel:child("output_panel")

		output_panel:stop()
		output_panel:animate(callback(self, self, "_animate_show_component"), output_panel:alpha())
		output_panel:animate(callback(self, self, "_animate_fade_output"))
	end
end