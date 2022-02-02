-- nvim-tree
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_side = "right"
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_show_icons = {
	folders = 0,
	files = 0
}

-- lualine
lualine_theme = os.date("*t", os.time()).hour >= 19 and "gruvbox_dark" or "gruvbox_light"
require'lualine'.setup {
  options = {
    icons_enabled = false,
    theme = lualine_theme,
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

require('telescope').setup{}

require('gitsigns').setup()
