function HUDTemp:show_carry_bag(carry_id, value)
	local bag_panel = self._temp_panel:child("bag_panel")
	local carry_data = tweak_data.carry[carry_id]
	local type_text = carry_data.name_id and managers.localization:text(carry_data.name_id)
	local bag_text = bag_panel:child("bag_text")
	local real_value = managers.money:get_secured_bonus_bag_value(carry_id, value)
	local font_size = 22

	bag_text:set_text(utf8.to_upper(type_text .. " \n " .. managers.experience:cash_string(real_value)))
	bag_panel:set_x(self._temp_panel:parent():w() / 2)
	bag_panel:set_visible(true)
	self._bg_box:child("bag_text"):set_visible(true)

	local carrying_text = managers.localization:text("hud_carrying")

	self._bg_box:child("bag_text"):set_text(utf8.to_upper(carrying_text .. " " .. type_text .. "\n" .. "VALUE: " .. managers.experience:cash_string(real_value)))
	self._bg_box:child("bag_text"):set_font_size(font_size)
	self._bg_box:set_w(self._bag_panel_w, self._bag_panel_h)
	self._bg_box:set_position(0, 0)
	bag_panel:stop()
	bag_panel:animate(callback(self, self, "_animate_show_bag_panel"))
end