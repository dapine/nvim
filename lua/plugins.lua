vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	-- essential
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'

	-- (v)ui
  use 'dapine/gruvbox-minimal'
  use 'kyazdani42/nvim-tree.lua'
  use 'nvim-treesitter/nvim-treesitter'
  use 'elianiva/gruvy.nvim'
  use 'hoob3rt/lualine.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
	use {
		'lewis6991/gitsigns.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		}
	}

	-- lsp, snippets, completion
  use 'neovim/nvim-lspconfig'
  use 'L3MON4D3/LuaSnip'
  use 'hrsh7th/cmp-nvim-lsp'
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-buffer",
    }
  }
end)
