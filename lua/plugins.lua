local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git',
							 'clone',
							 '--depth',
							 '1',
							 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
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
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use { "mfussenegger/nvim-jdtls", ft = { "java" } }

	if packer_bootstrap then
		require('packer').sync()
	end
end)
