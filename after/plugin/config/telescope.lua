local actions = require("telescope.actions")
local map = vim.keymap.set

require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "node_modules", "_build", "deps", "target", "venv" },
		path_display = { "tail" },
    prompt_prefix = '',
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<Esc>"] = actions.close,
      },
      n = {
        ["q"] = actions.close,
      },
    },
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        height = 0.9,
        preview_cutoff = 120,
        prompt_position = "bottom",
        width = 0.9,
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
    lsp_references = {
      initial_mode = "normal",
      include_declaration = false,
      show_line = false,
    },
  },
}

map('n', '<Leader>ff', require('telescope.builtin').find_files, options)
map('n', '<Leader>gr', require('telescope.builtin').live_grep, options)
map('n', '<Leader>b', require('telescope.builtin').buffers, options)
