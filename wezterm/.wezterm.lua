-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'
config.automatically_reload_config = true
config.font_size = 20.0
config.colors = {
    background = '#141414',
    cursor_bg = '#ffffff',
    cursor_border = '#ffffff',

}
config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_rate = 700
-- and finally, return the configuration to wezterm
return config
