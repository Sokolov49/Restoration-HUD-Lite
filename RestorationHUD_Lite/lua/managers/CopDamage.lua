function CopDamage:_show_death_hint(type)
	if CopDamage.is_civilian(type) and not self._unit:base().enemy then
		managers.hint:show_hint( "hint_killing_people", 3 )
	end
end