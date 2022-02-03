local M = {}

cur_hour = os.date("*t", os.time()).hour

M.background = cur_hour >= 19 and "dark" or "light"
M.colorscheme = "gruvbox"
M.lualine_theme = cur_hour >= 19 and "gruvbox_dark" or "gruvbox_light" 

return M
