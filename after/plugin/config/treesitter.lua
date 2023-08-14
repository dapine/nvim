require'nvim-treesitter.configs'.setup {
	ensure_installed = { "rust", "lua", "javascript", "typescript", 
											 "python", "bash", "html", "css",
										 	 "elixir", "java", "json", "toml",
										 	 "yaml" },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  playground = {
    enable = true,
  },
}
