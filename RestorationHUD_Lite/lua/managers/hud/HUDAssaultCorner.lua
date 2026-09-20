local data = HUDAssaultCorner.init
function HUDAssaultCorner:init(hud, full_hud, tweak_hud)
	data(self, tweak_data, hud, full_hud, tweak_hud)
	
	local yellow_tape = assault_panel:rect({
		layer = 1,
		name = "yellow_tape",
		visible = false,
		h = tweak_data.hud.location_font_size * 1.5,
		w = size * 3,
		color = Color(0.7, 0, 0)
	})

	yellow_tape:set_center(10, 10)
	yellow_tape:set_rotation(30)
	yellow_tape:set_blend_mode("add")
	assault_panel:panel({
		layer = 1,
		name = "text_panel",
		w = yellow_tape:w()
	}):set_center(yellow_tape:center())
end