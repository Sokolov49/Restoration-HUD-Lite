RestorationCoreHooks:Post(HUDInteraction, "init", function(self)
	local interact_text = self._hud_panel:child(self._child_name_text)
	if alive(interact_text) then
		local opt = {font = "fonts/font_medium_shadow_mf", font_size = 32, y = self._hud_panel:h() * 0.6}
		interact_text:configure(opt)
		self._hud_panel:child(self._child_ivalid_name_text):configure(opt)
	end
end)