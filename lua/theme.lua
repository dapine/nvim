local M = {}

local colorscheme_fallback = "default"
local lualine_theme_fallback = "auto"
local background_fallback = "dark"

local current_theme_ok, _ = pcall(require, "current_theme")
if not current_theme_ok then
	M.colorscheme = colorscheme_fallback
	M.lualine_theme = lualine_theme_fallback
	M.background = background_fallback

	return M
end

-- current_theme is a git ignored lua file with a module that exposes 
-- "colorscheme", "lualine_theme" and "background" (either dark or light).
-- e.g.
-- M = {}
-- M.colorscheme = "desert"
-- M.lualine_theme = "base16"
-- M.background = "dark"
-- return M
--
local current_theme = require("current_theme")
local colorscheme = current_theme.colorscheme
local background = current_theme.background
local lualine_theme = current_theme.lualine_theme


M.colorscheme = colorscheme ~= nil and colorscheme or colorscheme_fallback
M.lualine_theme = lualine_theme ~= nil and lualine_theme or lualine_theme_fallback
M.background = background ~= nil and background or "dark"

return M
