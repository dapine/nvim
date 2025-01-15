return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
	config = function()
		local actions = require("telescope.actions")
		local map = vim.keymap.set

		-- horizontal_fused layout strategy
		-- https://github.com/santhosh-tekuri/dotfiles/blob/16426fba8c7ef923f81fcf94aeb55fabb99b6140/nvim/lua/specs/telescope.lua#L33
		local layout_strategies = require("telescope.pickers.layout_strategies")
		layout_strategies.horizontal_fused = function(picker, max_columns, max_lines, layout_config)
			local layout = layout_strategies.horizontal(picker, max_columns, max_lines, layout_config)
			layout.prompt.title = ""
			layout.results.title = ""
			layout.preview.title = ""
			layout.results.height = layout.results.height + 1
			layout.results.borderchars = { "─", "│", "─", "│", "╭", "┬", "┤", "├" }
			layout.preview.borderchars = { "─", "│", "─", " ", "─", "╮", "╯", "─" }
			layout.prompt.borderchars = { "─", "│", "─", "│", "╭", "╮", "┴", "╰" }
			return layout
		end

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
				layout_strategy = "horizontal_fused",
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
			},
		})

		map("n", "<Leader>ff", require("telescope.builtin").find_files, { noremap = true })
		map("n", "<Leader>gr", require("telescope.builtin").live_grep, { noremap = true })
		map("n", "<Leader>b", require("telescope.builtin").buffers, { noremap = true })
	end,
}
