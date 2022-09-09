local ok, _ = pcall(require, 'nvim-tree')

if not ok then
	vim.notify('nvim-tree not loaded')
	return
end

require'nvim-tree'.setup {
  diagnostics = {
    enable = false,
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    side = 'right',
    signcolumn = "yes"
  },
	actions = {
		open_file = {
			quit_on_open = true
		}
	},
  renderer = {
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
		icons = {
			show = {
				file = false,
				folder = false,
				folder_arrow = false,
				git = true,
			}
		}
  },
  update_focused_file = {
    enable = true
  },
}
