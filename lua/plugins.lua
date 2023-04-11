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

require("lazy").setup({
	-- essential
	'tpope/vim-commentary',
	'tpope/vim-surround',

	-- (v)ui
	'dapine/gruvbox-minimal',
	'nvim-treesitter/nvim-treesitter',
	'elianiva/gruvy.nvim',
	{ 'ishan9299/modus-theme-vim', lazy=true },
	'hoob3rt/lualine.nvim',
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	'lewis6991/gitsigns.nvim',
	"lukas-reineke/indent-blankline.nvim",
    "luukvbaal/nnn.nvim",

	-- lsp, snippets, completion
	'neovim/nvim-lspconfig',
	'hrsh7th/cmp-nvim-lsp',
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-buffer",
		}
	},
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	{ "mfussenegger/nvim-jdtls", ft = { "java" } }
}, opts)
