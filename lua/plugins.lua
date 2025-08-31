vim.pack.add({ "https://github.com/miikanissi/modus-themes.nvim.git" })
vim.pack.add({ "https://github.com/stevearc/conform.nvim.git" })
vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim.git" })
vim.pack.add({ "https://github.com/ThePrimeagen/harpoon.git" })
vim.pack.add({ "https://github.com/nvim-mini/mini.nvim.git" })
vim.pack.add({ "https://github.com/chrisgrieser/nvim-spider.git" })
vim.pack.add({ "https://github.com/stevearc/oil.nvim.git" })
vim.pack.add({ "https://github.com/nvim-lua/plenary.nvim.git" })
vim.pack.add({ "https://github.com/nvim-telescope/telescope.nvim.git" })
vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter.git" })
vim.pack.add({ "https://github.com/RRethy/nvim-treesitter-endwise.git" })

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "goimports-reviser", "golines" },
		rust = { "rustfmt" },
	},
	format_on_save = {
		timeout_ms = 5000,
		lsp_fallback = true,
	},
})

require("gitsigns").setup({
	on_attach = function()
		local gs = package.loaded.gitsigns

		vim.keymap.set("n", "<leader>gb", gs.toggle_current_line_blame)
	end,
})

require("harpoon").setup()

require("mini.trailspace").setup()
require("mini.surround").setup({
	mappings = {
		add = "S",
	},
})
require("mini.indentscope").setup({
	draw = {
		animation = require("mini.indentscope").gen_animation.none(),
	},
	symbol = "┊",
})
require("mini.pairs").setup({})

require("oil").setup({
	keymaps = {
		["q"] = { "actions.close", mode = "n" },
		["H"] = { "actions.parent", mode = "n" },
	},
})

local layout_strategies = require("telescope.pickers.layout_strategies")
layout_strategies.horizontal_fused = function(picker, max_columns, max_lines, layout_config)
	local layout = layout_strategies.horizontal(picker, max_columns, max_lines, layout_config)
	layout.prompt.title = ""
	layout.results.title = ""
	layout.results.height = layout.results.height + 1
	if layout.preview ~= false then
		layout.preview.title = ""
		layout.preview.borderchars = { "─", "│", "─", " ", "─", "┐", "┘", "─" }
		layout.results.borderchars = { "─", "│", "─", "│", "┌", "┬", "┤", "├" }
		layout.prompt.borderchars = { "─", "│", "─", "│", "┌", "┐", "┴", "└" }
	else
		layout.results.borderchars = { "─", "│", "─", "│", "┌", "┐", "┤", "├" }
		layout.prompt.borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }
	end
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
				["<Esc>"] = require("telescope.actions").close,
			},
			n = {
				["q"] = require("telescope.actions").close,
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

require("nvim-treesitter.configs").setup({
	highlight = { enable = true },
	indent = { enable = true },
	endwise = { enable = true },
	ensure_installed = { "rust", "lua", "bash", "elixir", "eex", "heex" },
})
