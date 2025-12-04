-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

-- This is where you actually apply your config choices

config.color_scheme = 'Catppuccin Macchiato'

config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 14

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.9

config.wsl_domains = {
    {
        name = 'WSL:archlinux',
        distribution = 'archlinux',
        username = 'hgebk',
        default_cwd = '~'
    }
}
config.default_domain = 'WSL:archlinux'

config.keys = {
  -- paste from the clipboard
    {
        key = 'v',
        mods = 'CTRL',
        action = act.PasteFrom 'Clipboard'
    },

    {
        key = 'c',
        mods = 'CTRL',
        action = act.CopyTo 'Clipboard'
    }

  -- paste from the primary selection
 -- { key = 'V', mods = 'CTRL', action = act.PasteFrom 'PrimarySelection' },
}

-- and finally, return the configuration to wezterm
return config