local actions = require("telescope.actions")
local map = vim.keymap.set

require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "node_modules", "_build", "deps", "target", "venv" },
		path_display = { "tail" },
		prompt_prefix = " ",
		mappings = {
			i = {
				["<C-u>"] = false,
				["<Esc>"] = actions.close,
			},
			n = {
				["q"] = actions.close,
			},
		},
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				height = 0.8,
				preview_cutoff = 120,
				prompt_position = "top",
				width = 0.8,
				preview_width = 0.6,
			},
		},
		borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
	},
	pickers = {
		buffers = {
			initial_mode = "normal",
		},
		diagnostics = {
			initial_mode = "normal",
		},
		lsp_references = {
			initial_mode = "normal",
			include_declaration = false,
			show_line = false,
		},
		find_files = {
			prompt_title = "",
			results_title = "",
			previewer = false,
			sorting_strategy = "ascending",
			layout_config = {
				height = 0.5,
				width = 0.5,
			},
		},
		live_grep = {
			prompt_title = "",
			results_title = "",
			preview_title = "",
			sorting_strategy = "ascending",
		},
	},
})

map("n", "<Leader>ff", require("telescope.builtin").find_files, { noremap = true })
map("n", "<Leader>gr", require("telescope.builtin").live_grep, { noremap = true })
map("n", "<Leader>b", require("telescope.builtin").buffers, { noremap = true })
