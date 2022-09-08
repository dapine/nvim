local M = {}

local cur_hour = os.date("*t", os.time()).hour
local is_night = cur_hour >= 19

colorscheme_light = "modus-operandi"
colorscheme_dark = "modus-vivendi"
colorscheme_fallback = "default"

lualine_light = "onelight"
lualine_dark = "modus-vivendi"

M.background = is_night and "dark" or "light"
M.colorscheme = is_night and colorscheme_dark or colorscheme_light
M.lualine_theme = is_night and lualine_dark or lualine_light
M.colorscheme_fallback = colorscheme_fallback

return M
