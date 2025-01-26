-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'Catppuccin Macchiato' -- or Mocha, Frappe, Latte
config.automatically_reload_config = true
config.font = wezterm.font 'HackNerdFont'
config.font_size = 18.0
-- You can specify some parameters to influence the font selection;
-- for example, this selects a Bold, Italic font variant.
-- config.font = wezterm.font 'Fira Code'
config.colors = {
  -- background = '#242933',
  background = '#000000',
  cursor_bg = '#c0c8d8',
  cursor_border = '#c0c8d8',

}
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}
-- ...your existing config
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
config.window_background_opacity = 0.9
config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_rate = 700
config.hide_tab_bar_if_only_one_tab = true
config.hide_mouse_cursor_when_typing = true
-- and finally, return the configuration to wezterm
return config
