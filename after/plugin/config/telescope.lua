local actions = require("telescope.actions")
local map = vim.keymap.set

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
    diagnostics = {
      initial_mode = "normal"
    },
  },
}

map('n', '<Leader>ff', require('telescope.builtin').find_files, options)
map('n', '<Leader>gr', require('telescope.builtin').live_grep, options)
map('n', '<Leader>b', require('telescope.builtin').buffers, options)
