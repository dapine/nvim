require('gitsigns').setup({
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    local map = vim.keymap.set

    map('n', '<leader>gb', gs.toggle_current_line_blame)
  end
})
