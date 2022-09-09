local theme_ok, _ = pcall(require, 'theme')
local lualine_ok, _ = pcall(require, 'lualine')

if not theme_ok then
	vim.notify('theme not loaded')
	return
end
if not lualine_ok then
	vim.notify('lualine not loaded')
	return
end

local theme = require "theme"
require'lualine'.setup {
  options = {
    icons_enabled = false,
    theme = theme.lualine_theme,
    component_separators = {left = '', right = ''},
    section_separators = {left = '', right = ''},
    disabled_filetypes = {}
  },

  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', '', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
		lualine_a = {'buffers'},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
  extensions = {}
}
