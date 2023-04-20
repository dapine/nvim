local ok, _ = pcall(require, 'nvim-treesitter.configs')

if not ok then
	vim.notify('nvim-treesitter not loaded')
	return
end

require'nvim-treesitter.configs'.setup {
	ensure_installed = { "rust", "lua", "javascript", "typescript", 
											 "python", "bash", "html", "css",
										 	 "elixir", "java", "json", "toml",
										 	 "yaml" },
  highlight = {
    enable = true,
  }
}
