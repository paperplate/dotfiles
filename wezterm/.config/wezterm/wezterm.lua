local wezterm = require("wezterm")
local config = {}

--config.window_decorations = "RESIZE"
config.enable_tab_bar = false

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_prog = { "pwsh.exe", "-NoLogo" }
end

-- Key bindings
config.keys = {
	{
		key = "w",
		mods = "CTRL",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
}

return config
