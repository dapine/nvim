local ok, _ = pcall(require, 'nvim-treesitter.configs')

if not ok then
	vim.notify('nvim-treesitter not loaded')
	return
end

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  }
}
