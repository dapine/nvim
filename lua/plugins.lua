vim.pack.add({ "https://github.com/miikanissi/modus-themes.nvim.git" })
vim.pack.add({ "https://github.com/stevearc/conform.nvim.git" })
vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim.git" })
vim.pack.add({ "https://github.com/ThePrimeagen/harpoon.git" })
vim.pack.add({ "https://github.com/nvim-mini/mini.nvim.git" })
vim.pack.add({ "https://github.com/chrisgrieser/nvim-spider.git" })
vim.pack.add({ "https://github.com/stevearc/oil.nvim.git" })
vim.pack.add({ "https://github.com/nvim-lua/plenary.nvim.git" })
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
require("mini.pick").setup()

require("oil").setup({
	keymaps = {
		["q"] = { "actions.close", mode = "n" },
		["H"] = { "actions.parent", mode = "n" },
	},
})

require("nvim-treesitter.configs").setup({
	highlight = { enable = true },
	indent = { enable = true },
	endwise = { enable = true },
	ensure_installed = { "rust", "lua", "bash", "elixir", "eex", "heex" },
})
