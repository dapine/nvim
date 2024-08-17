local map = vim.keymap.set

local my_prefix = function(fs_entry)
  if fs_entry.fs_type == 'directory' then
    return ' ', 'MiniFilesDirectory'
  elseif fs_entry.fs_type == 'file' then
    return ' ', 'MiniFilesFile'
  end
  return MiniFiles.default_prefix(fs_entry)
end

require('mini.files').setup({
  content = {
    prefix = my_prefix,
  },
})
require('mini.trailspace').setup()
require('mini.surround').setup({
  mappings = {
    add = 'S'
  }
})
require('mini.indentscope').setup({
  draw = {
    animation = require('mini.indentscope').gen_animation.none()
  },
  symbol = '┊',
})

local files_set_cwd = function(path)
  local cur_entry_path = MiniFiles.get_fs_entry().path
  local cur_directory = vim.fs.dirname(cur_entry_path)
  vim.fn.chdir(cur_directory)
end

local map_split = function(buf_id, lhs, direction)
  local rhs = function()
    local new_target_window
    vim.api.nvim_win_call(MiniFiles.get_target_window(), function()
      vim.cmd(direction .. ' split')
      new_target_window = vim.api.nvim_get_current_win()
    end)

    MiniFiles.set_target_window(new_target_window)
  end

  local desc = 'Split ' .. direction
  vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
end

vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesBufferCreate',
  callback = function(args)
    vim.keymap.set('n', 'g~', files_set_cwd, { buffer = args.data.buf_id })
  end,
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesBufferCreate',
  callback = function(args)
    local buf_id = args.data.buf_id
    map_split(buf_id, '-', 'belowright horizontal')
    map_split(buf_id, '|', 'belowright vertical')
  end,
})

map('n', '<Leader>fb', function() MiniFiles.open() end, options)
