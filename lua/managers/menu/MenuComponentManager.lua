function MenuComponentManager:_create_newsfeed_gui()
	if not self._menuscene_info_gui or self._newsfeed_gui then
		return
	end

	self:create_newsfeed_gui()
end
