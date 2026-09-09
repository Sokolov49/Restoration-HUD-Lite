Hooks:PostHook( LevelsTweakData, "init", "aaaaxd", function(self)
	for k, v in pairs (self) do
		v["load_screen"] = "guis/textures/loading/loading_bg"
	end
end)