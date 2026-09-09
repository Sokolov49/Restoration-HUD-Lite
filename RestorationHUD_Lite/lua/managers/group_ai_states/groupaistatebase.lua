function GroupAIStateBase:_hostage_hint_clbk()
	if not self._ai_enabled then
		return
	end
	
	local job = Global.level_data and Global.level_data.level_id

	if not self._first_hostage_hint then
		self._hstg_hint_clbk = nil
	end
	
	if self._hostage_headcount == 0 then
		if self._first_hostage_hint then
			managers.hint:show_hint( "control_civilians", 5, nil, { BTN_INTERACT = managers.localization:btn_macro( "interact" ) } )
			self._first_hostage_hint = nil
			managers.enemy:add_delayed_clbk( "_hostage_hint_clbk", self._hstg_hint_clbk, Application:time() + 120 )
		else
			managers.hint:show_hint( "take_hostages", 5, nil, { BTN_INTERACT = managers.localization:btn_macro( "interact" ) } )
		end
	else
		self._hstg_hint_clbk = nil
	end
end