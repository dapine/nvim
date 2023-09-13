local actions = require("telescope.actions")
require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "node_modules", "_build", "deps", "target", "venv" },
		path_display = { "smart" },
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<Esc>"] = actions.close,
      },
      n = {
        ["q"] = actions.close,
      },
    },
  },
  pickers = {
    buffers = {
      initial_mode = "normal"
    },
  },
}
