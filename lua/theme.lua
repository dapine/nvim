local M = {}

local colorscheme_fallback = "default"
local background_fallback = "dark"
local use_nerd_font_default = false

local current_theme_ok, _ = pcall(require, "current_theme")
if not current_theme_ok then
	M.colorscheme = colorscheme_fallback
	M.background = background_fallback
	M.use_nerd_font = use_nerd_font_default

	return M
end

-- current_theme is a git ignored lua file with a module that exposes 
-- "colorscheme" and "background" (either dark or light).
-- e.g.
-- M = {}
-- M.colorscheme = "desert"
-- M.background = "dark"
-- return M
--
local current_theme = require("current_theme")
local colorscheme = current_theme.colorscheme
local background = current_theme.background
local use_nerd_font = current_theme.use_nerd_font

M.colorscheme = colorscheme ~= nil and colorscheme or colorscheme_fallback
M.background = background ~= nil and background or "dark"
M.use_nerd_font = use_nerd_font

return M
