require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "node_modules", "_build", "deps", "target", "venv" },
		path_display = { "smart" },
  },
}
