local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Kanagawa (Gogh)"
config.font = wezterm.font("Iosevka Nerd Font")
config.font_size = 17.0
config.window_background_opacity = 0.94
config.default_prog = { "/bin/zsh", "-l", "-c", "zellij" }
config.enable_tab_bar = false
config.window_decorations = "RESIZE | MACOS_FORCE_ENABLE_SHADOW"

return config
