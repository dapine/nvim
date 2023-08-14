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
	{ 'numToStr/Comment.nvim', config = function() require('Comment').setup() end, lazy = false },
	{
		'kylechui/nvim-surround',
		version = '*',
		event = 'VeryLazy',
		config = function()
			require('nvim-surround').setup()
		end
	},

	-- (v)ui
  { 'nvim-treesitter/nvim-treesitter', lazy = false },
  { 'nvim-treesitter/playground', lazy = false },
	'lewis6991/gitsigns.nvim',
	"lukas-reineke/indent-blankline.nvim",
	"onsails/lspkind.nvim",

	-- navigation
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	"luukvbaal/nnn.nvim",
  'chrisgrieser/nvim-spider',
  { 'ThePrimeagen/harpoon', lazy = false },

	-- colorschemes
	{ 'ishan9299/modus-theme-vim', lazy=true },
	'elianiva/gruvy.nvim',
	'dapine/gruvbox-minimal',
	'folke/tokyonight.nvim',
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
	'windwp/nvim-autopairs',
	{ 'saadparwaiz1/cmp_luasnip', lazy = false },
  'jose-elias-alvarez/null-ls.nvim',
}, opts)
