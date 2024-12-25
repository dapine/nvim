local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",

		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local opts = {
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
	defaults = {
		lazy = true,
	},
}

require("lazy").setup({
	-- essential
	{ "echasnovski/mini.nvim", version = false },

	-- (v)ui
	{ "nvim-treesitter/nvim-treesitter", lazy = false },
	"lewis6991/gitsigns.nvim",
	{
		"onsails/lspkind.nvim",
		config = function()
			require("lspkind").init()
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},

	-- navigation
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
	},
	"chrisgrieser/nvim-spider",
	{ "ThePrimeagen/harpoon", lazy = false },
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- colorschemes
	{ "miikanissi/modus-themes.nvim", priority = 1000, lazy = false },
	{ "catppuccin/nvim", name = "catppuccin", lazy = false },

	-- lsp, snippets, completion
	"neovim/nvim-lspconfig",
	{ "hrsh7th/cmp-nvim-lsp", lazy = false },
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-buffer",
		},
	},
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	{ "saadparwaiz1/cmp_luasnip", lazy = false },
	"stevearc/conform.nvim",
	{ "RRethy/nvim-treesitter-endwise", lazy = false },

	-- languages
	{
		"elixir-tools/elixir-tools.nvim",
		version = "*",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}, opts)
