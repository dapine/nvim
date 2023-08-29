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

-- e.g.
-- window = vim.api.nvim_tabpage_get_win(0)
-- window_list = vim.api.nvim_tabpage_list_wins(0)
local function get_surroundings(window, window_list)
  local surroundings = {
    top = nil,
    right = nil,
    bottom = nil,
    left = nil,
  }

  local current_window_position = vim.api.nvim_win_get_position(window)
  local current_window_x, current_window_y = current_window_position[1], current_window_position[2]

  for _, win in ipairs(window_list) do
    local win_pos = vim.api.nvim_win_get_position(win)
    local x, y = win_pos[1], win_pos[2]

    if (current_window_y < y) then
      surroundings.right = win
    elseif (current_window_y > y) then
      surroundings.left = win
    elseif (current_window_x > x) then
      surroundings.top = win
    elseif (current_window_x < x) then
      surroundings.bottom = win
    end
  end

  return surroundings
end

local function has_top(current_window, window_list)
  local s = get_surroundings(current_window, window_list)
  return s.top ~= nil and true or false
end

local function has_right(current_window, window_list)
  local s = get_surroundings(current_window, window_list)
  return s.right ~= nil and true or false
end

local function has_bottom(current_window, window_list)
  local s = get_surroundings(current_window, window_list)
  return s.bottom ~= nil and true or false
end

local function has_left(current_window, window_list)
  local s = get_surroundings(current_window, window_list)
  return s.left ~= nil and true or false
end

return M
