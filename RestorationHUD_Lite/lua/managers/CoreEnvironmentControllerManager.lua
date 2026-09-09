Hooks:PostHook(CoreEnvironmentControllerManager, "refresh_render_settings", "show_film_grain", function(self, vp, hud, full_hud)
	if not alive( self._vp ) then
		return
	end
	
	local size = self._full_hud_panel:w() + 50
	self._full_hud_panel:bitmap( { name = "noise", texture = "core/textures/noise", color = Color( 0.2, 0.0, 0.0, 0.0 ), layer = 3, wrap_mode="wrap", w = size, h = size, valign = "scale", halign = "scale", blend_mode = "normal" } )
	self._full_hud_panel:child( "noise" ):set_texture_rect( 0, 0, size, size )
	
	self._full_hud_panel:bitmap( { x = 0, y = 0, name = "noise2", texture = "core/textures/noise", color = Color( 0.2, 0.0, 0.0, 0.0 ), layer = 3, wrap_mode="wrap", w = size, h = size, valign = "scale", halign = "scale", blend_mode = "normal" } )
	self._full_hud_panel:child( "noise2" ):set_texture_rect( 0, 0, size, size )
end)