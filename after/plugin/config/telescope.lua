local ok, _ = pcall(require, 'telescope')

if not ok then
	vim.notify('telescope not loaded')
	return
end

require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "node_modules", "_build", "deps", "target", "venv" },
  },
	extensions = {
		file_browser = {
			cwd_to_path = true,
			dir_icon = "",
			prompt_path = true,
			initial_mode = "normal",
			display_stat = {}
		}
	},
}
require("telescope").load_extension "file_browser"
