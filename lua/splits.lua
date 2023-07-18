local M = {}

local default_settings = {
  left = "<A-h>",
  right = "<A-l>",
  up = "<A-k>",
  down = "<A-j>",
  zoom = "<Leader>z",
  horizontal_terminal = "<A-->",
  vertical_terminal = "<A-\\>",
}

function M.zoom()
  vim.api.nvim_input('<C-w>_')
  vim.api.nvim_input('<C-w>|')
  vim.t.is_zoomed = true
end

function M.unzoom()
  vim.api.nvim_input('<C-w>=')
  vim.t.is_zoomed = false
end

function M.toggle_zoom_split()
  local splits = #vim.api.nvim_tabpage_list_wins(0)
  local is_zoomed = vim.t.is_zoomed

  if not is_zoomed and splits > 1 then
    M.zoom()
  else
    M.unzoom()
  end
end

function M.go_to_split(direction)
  if vim.t.is_zoomed then
    M.unzoom()
  end

  local directions = {
    regular = {
      left = "<C-w>h",
      right = "<C-w>l",
      up = "<C-w>k",
      down = "<C-w>j",
    },
    terminal = {
      left = "<C-\\><C-N><C-w>h",
      right = "<C-\\><C-N><C-w>l",
      up = "<C-\\><C-N><C-w>k",
      down = "<C-\\><C-N><C-w>j",
    },
  }
  local buftype = vim.api.nvim_buf_get_option(0, 'buftype')
  buftype = buftype == "terminal" and "terminal" or "regular"

  vim.api.nvim_input(directions[buftype][direction])
end

function M.setup()
  vim.keymap.set('n', default_settings.left, function () M.go_to_split('left') end, {})
  vim.keymap.set('n', default_settings.down, function () M.go_to_split('down') end, {})
  vim.keymap.set('n', default_settings.up, function () M.go_to_split('up') end, {})
  vim.keymap.set('n', default_settings.right, function () M.go_to_split('right') end, {})

  vim.keymap.set('t', default_settings.left, function () M.go_to_split('left') end, {})
  vim.keymap.set('t', default_settings.down, function () M.go_to_split('down') end, {})
  vim.keymap.set('t', default_settings.up, function () M.go_to_split('up') end, {})
  vim.keymap.set('t', default_settings.right, function () M.go_to_split('right') end, {})

  vim.keymap.set('n', default_settings.zoom, M.toggle_zoom_split, {})

  vim.keymap.set('n', default_settings.horizontal_terminal, function () vim.api.nvim_command('Hterm') end, {})
  vim.keymap.set('n', default_settings.vertical_terminal, function () vim.api.nvim_command('Vterm') end, {})
end

return M
