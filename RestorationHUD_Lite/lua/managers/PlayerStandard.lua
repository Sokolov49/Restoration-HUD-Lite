Hooks:PostHook(PlayerStandard, "_start_action_ducking", "stealth_hint", function(self)
	if self:_on_zipline() then
		return
	end

	managers.hint:show_hint( "crouch_sneak" )
end)