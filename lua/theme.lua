-- current_theme is a git ignored lua file with a module that exposes
-- "colorscheme" and "background" (either dark or light).
-- e.g.
-- M = {}
-- M.colorscheme = "desert"
-- M.background = "dark"
-- return M

local M = {}

local colorscheme_fallback = "default"
local background_fallback = "dark"
local use_nerd_font_default = false

local colorscheme = colorscheme_fallback
local background = background_fallback
local use_nerd_font = use_nerd_font_default

local current_theme_ok, _ = pcall(require, "current_theme")
if current_theme_ok then
  local ct = require("current_theme")
  if ct.colorscheme ~= nil then colorscheme = ct.colorscheme end
  if ct.background ~= nil then background = ct.background end
  if ct.use_nerd_font ~= nil then use_nerd_font = ct.use_nerd_font end
end

function M.prepare()
  vim.g.my_colorscheme = colorscheme
  vim.g.my_background = background
  vim.g.my_use_nerd_font = use_nerd_font
end

function M.setup()
  vim.bo.syntax = "on"
  vim.opt.termguicolors = true
  vim.o.background = background
  vim.cmd("colorscheme " .. colorscheme)
end

return M
