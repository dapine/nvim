-- This module exposes a command to toggle the "buffer change mode".
-- The "buffer change mode" when active, maps a key to change 
-- to the next buffer and another to the previous buffer.

local M = {}

local defaultOpts = {
	keybinds = {
		previous_buffer = 'i',
		next_buffer = 'o',
		select_buffer = '<Return>',
		toggle_bufchange_mode = '<leader><Space>',
	},
	view = {
		popup_style = 'minimal',
		popup_border = 'rounded',
	}
}

M.setup = function(opts)
	if opts == nil then
		opts = {
			keybinds = {},
			view = {},
		}
	else
		opts.keybinds = opts.keybinds or {}
		opts.view = opts.view or {}
	end

	for k, v in pairs(opts.keybinds) do	defaultOpts.keybinds[k] = v	end
	for k, v in pairs(opts.view) do defaultOpts.view[k] = v	end

	vim.api.nvim_set_var("bufchange_mode", false)
	vim.api.nvim_create_user_command("ToggleBufchangeMode", toggle, {})
	vim.api.nvim_set_keymap('n', defaultOpts.keybinds.toggle_bufchange_mode, ':ToggleBufchangeMode<cr>', {})
end


function toggle()
  local is_active = vim.api.nvim_get_var("bufchange_mode")

  if (is_active) then
    -- toggles off
    local buf = vim.api.nvim_get_var("msg_buffer")
    local handle = vim.api.nvim_get_var("msg_win_handle")

    vim.api.nvim_win_close(handle, true)

    vim.api.nvim_buf_delete(buf, { force = true })
    vim.api.nvim_del_var("msg_buffer")
    vim.api.nvim_del_keymap('n', defaultOpts.keybinds.previous_buffer)
    vim.api.nvim_del_keymap('n', defaultOpts.keybinds.next_buffer)
    vim.api.nvim_del_keymap('n', defaultOpts.keybinds.select_buffer)
    vim.api.nvim_set_var("bufchange_mode", false)
  else
    -- toggles on
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_set_var("msg_buffer", buf)
    vim.api.nvim_set_var("bufchange_mode", true)

    vim.api.nvim_set_keymap('n', defaultOpts.keybinds.previous_buffer, ':bprevious<cr>', {})
    vim.api.nvim_set_keymap('n', defaultOpts.keybinds.next_buffer, ':bnext<cr>', {})
    vim.api.nvim_set_keymap('n', defaultOpts.keybinds.select_buffer, ':ToggleBufchangeMode<cr>', {})

    vim.api.nvim_buf_set_lines(buf, 0, -1, true, {'', ' BUFCHANGE MODE ON ', ''})

    local win_width = 19
    local win_height = 3

    local row = (vim.api.nvim_win_get_height(0) / 2) - (win_height / 2)
    local col = (vim.api.nvim_win_get_width(0) / 2) - (win_width / 2)

    local win_opts = {
      relative='win', 
      row=row, 
      col=col,
      width=win_width,
      height=win_height,
      style=defaultOpts.view.popup_style,
      border=defaultOpts.view.popup_border,
      focusable=false
    }

    local handle = vim.api.nvim_open_win(buf, false, win_opts)
    vim.api.nvim_set_var("msg_win_handle", handle)
  end
end


return M
