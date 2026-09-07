function MenuNodeCrimenetGui:init(node, layer, parameters)
	parameters.font = tweak_data.menu.pd2_small_font
	parameters.font_size = tweak_data.menu.pd2_small_font_size
	parameters.align = "left"
	parameters.row_item_blend_mode = "add"
	parameters.row_item_color = tweak_data.screen_colors.button_stage_3
	parameters.row_item_hightlight_color = tweak_data.screen_colors.button_stage_2
	parameters.marker_alpha = 0.35
	parameters.to_upper = true

	MenuNodeCrimenetGui.super.init(self, node, layer, parameters)
end

function MenuNodeCrimenetFiltersGui:init(node, layer, parameters)
	parameters.font = tweak_data.menu.pd2_small_font
	parameters.font_size = tweak_data.menu.pd2_small_font_size
	parameters.align = "left"
	parameters.row_item_blend_mode = "add"
	parameters.row_item_color = tweak_data.screen_colors.button_stage_3
	parameters.row_item_hightlight_color = tweak_data.screen_colors.button_stage_2
	parameters.marker_alpha = 0.35
	parameters.to_upper = true
	self.static_y = node:parameters().static_y

	MenuNodeCrimenetFiltersGui.super.init(self, node, layer, parameters)
end

function MenuNodeCrimenetCasinoGui:init(node, layer, parameters)
	parameters.font = tweak_data.menu.pd2_small_font
	parameters.font_size = tweak_data.menu.pd2_small_font_size
	parameters.align = "left"
	parameters.row_item_blend_mode = "add"
	parameters.row_item_color = tweak_data.screen_colors.button_stage_3
	parameters.row_item_hightlight_color = tweak_data.screen_colors.button_stage_2
	parameters.marker_alpha = 0.35
	parameters.to_upper = true

	MenuNodeCrimenetCasinoGui.super.init(self, node, layer, parameters)
	self:_setup_layout()
end

function MenuNodeCrimenetContactInfoGui:init(node, layer, parameters)
	parameters.font = tweak_data.menu.pd2_small_font
	parameters.font_size = tweak_data.menu.pd2_small_font_size
	parameters.align = "left"
	parameters.row_item_blend_mode = "add"
	parameters.row_item_color = tweak_data.screen_colors.button_stage_3
	parameters.row_item_hightlight_color = tweak_data.screen_colors.button_stage_2
	parameters.marker_alpha = 0.35
	parameters.to_upper = true
	self._codex_text = managers.localization:to_upper_text(self.CODEX_TEXT_ID)
	self._current_file = 0
	self._sound_source = SoundDevice:create_source(self.SOUND_SOURCE_NAME)
	local active_menu = managers.menu:active_menu()

	if active_menu then
		active_menu.input:set_force_input(true)
	end

	self._file_icons = self.FILE_ICONS

	MenuNodeCrimenetContactInfoGui.super.init(self, node, layer, parameters)
	managers.menu_component:disable_crimenet()
	self:_setup_layout()

	if not managers.menu:is_pc_controller() then
		managers.menu:active_menu().input:deactivate_controller_mouse()
	end
end

function MenuNodeCrimenetContactShortGui:init(node, layer, parameters)
	parameters.font = tweak_data.menu.pd2_small_font
	parameters.font_size = tweak_data.menu.pd2_small_font_size
	parameters.align = "left"
	parameters.row_item_blend_mode = "add"
	parameters.row_item_color = tweak_data.screen_colors.button_stage_3
	parameters.row_item_hightlight_color = tweak_data.screen_colors.button_stage_2
	parameters.marker_alpha = 0.35
	parameters.to_upper = true
	local active_menu = managers.menu:active_menu()

	if active_menu then
		active_menu.input:set_force_input(true)
	end

	MenuNodeCrimenetContactShortGui.super.init(self, node, layer, parameters)
	managers.menu_component:disable_crimenet()
	self:_setup_layout()

	if not managers.menu:is_pc_controller() then
		managers.menu:active_menu().input:deactivate_controller_mouse()
	end
end

function MenuNodeOpenContainerGui:init(node, layer, parameters)
	parameters.font = tweak_data.menu.pd2_small_font
	parameters.font_size = tweak_data.menu.pd2_small_font_size
	parameters.align = "left"
	parameters.halign = "left"
	parameters.row_item_blend_mode = "add"
	parameters.row_item_color = tweak_data.screen_colors.button_stage_3
	parameters.row_item_hightlight_color = tweak_data.screen_colors.button_stage_2
	parameters.marker_alpha = 0.35
	parameters.to_upper = true

	MenuNodeOpenContainerGui.super.init(self, node, layer, parameters)
end