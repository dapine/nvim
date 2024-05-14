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
			}
		}
	},
  defaults = {
    lazy = true,
  },
}

require("lazy").setup({
	-- essential
	{ 'echasnovski/mini.nvim', version = false },

	-- (v)ui
  { 'nvim-treesitter/nvim-treesitter', lazy = false },
  { 'nvim-treesitter/playground', lazy = false },
	'lewis6991/gitsigns.nvim',
	"lukas-reineke/indent-blankline.nvim",
	{ "onsails/lspkind.nvim", config = function() require('lspkind').init() end },

	-- navigation
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' }
	},
  'chrisgrieser/nvim-spider',
  { 'ThePrimeagen/harpoon', lazy = false },

	-- colorschemes
	{ 'ishan9299/modus-theme-vim', lazy=false },
	{ "catppuccin/nvim", name = "catppuccin" },

	-- lsp, snippets, completion
	'neovim/nvim-lspconfig',
	{ 'hrsh7th/cmp-nvim-lsp', lazy = false },
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-buffer",
		}
	},
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	{ "mfussenegger/nvim-jdtls", ft = { "java" } },
	{ 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup() end },
	{ 'saadparwaiz1/cmp_luasnip', lazy = false },
  'stevearc/conform.nvim',
}, opts)
