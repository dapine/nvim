vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	-- essential
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'lewis6991/impatient.nvim'

	-- (v)ui
  use 'dapine/gruvbox-minimal'
  use 'kyazdani42/nvim-tree.lua'
  use 'nvim-treesitter/nvim-treesitter'
  use 'elianiva/gruvy.nvim'
  use 'ishan9299/modus-theme-vim'
  use 'hoob3rt/lualine.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
	use 'lewis6991/gitsigns.nvim'

	-- lsp, snippets, completion
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use {
    "hrsh7th/nvim-cmp",
    requires = {
		  "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-buffer",
    }
  }
end)
