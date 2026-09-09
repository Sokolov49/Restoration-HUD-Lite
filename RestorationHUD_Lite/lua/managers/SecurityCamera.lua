Hooks:PostHook(SecurityCamera, "generate_cooldown", "camera_hint", function(self)
	managers.hint:show_hint( "destroyed_security_camera", 3 )
end)