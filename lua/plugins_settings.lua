-- buftabline
require('buftabline').setup {
    options = {
        modifier = ":t",
        index_format = "%d: ",
        buffer_id_index = false,
        padding = 1,
        icons = false,
        icon_colors = false,
        start_hidden = false,
        auto_hide = false,
        disable_commands = false,
        go_to_maps = true,
        kill_maps = false,
        next_indicator = ">",
        custom_command = nil,
        custom_map_prefix = nil,
        hlgroup_current = "TabLineSel",
        hlgroup_normal = "TabLineFill",
    }
}

-- nvim-tree
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_side = "right"
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_show_icons = {
	folders = 0,
	files = 0
}

-- lualine
require'lualine'.setup {
  options = {
    icons_enabled = false,
    theme = 'gruvbox_light',
    component_separators = {'', ''},
    section_separators = {'', ''},
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
  tabline = {},
  extensions = {}
}

require('telescope').setup{}

require('gitsigns').setup()
