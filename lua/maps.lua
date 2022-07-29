local map = vim.api.nvim_set_keymap

map('n', '<Space>', '', {})
vim.g.mapleader = ' '

options = { noremap = true }

map('n', '0', '^', options)
map('n', ',', ';', options)
map('n', ';', ':', options)
map('n', 's', '*', options)
map('n', 'j', 'gj', options)
map('n', 'k', 'gk', options)
map('n', 'n', 'nzz', options)
map('n', 'N', 'Nzz', options)

map('i', 'jk', '<esc>', options)
map('i', '<C-d>', '<del>', options)
map('i', '<A-i>', '<esc>:bprevious<cr>', options)
map('i', '<A-o>', '<esc>:bnext<cr>', options)

map('v', 'j', 'gj', options)
map('v', 'k', 'gk', options)

map('n', '<A-n>', ':NvimTreeToggle<cr>', options)
map('n', '<Leader>b', ':Buffers<cr>', options)
map('n', '<Leader>q', ':bw<cr>', options)

map('n', '<A-f>', '<C-f>', options)
map('n', '<A-b>', '<C-b>', options)
map('n', '<C-f>', '<Nop>', options)
map('n', '<C-b>', '<Nop>', options)

map('n', '<A-h>', '<C-w>h', options)
map('n', '<A-j>', '<C-w>j', options)
map('n', '<A-k>', '<C-w>k', options)
map('n', '<A-l>', '<C-w>l', options)

map('n', '<Leader>ff', '<cmd>Telescope find_files<cr>', options)
map('n', '<Leader>fb', '<cmd>Telescope file_browser<cr>', options)

map('i', '<C-n>', '<Nop>', options)

-- Acme-like go to next word occurrence.
-- Maybe add a plumbing mechanism in the future?
function search()
  vim.api.nvim_input('*')
end

map('n', '<RightMouse>', ':lua search()<cr>', options)
map('n', '<2-RightMouse>', ':lua search()<cr>', options)
map('n', '<3-RightMouse>', ':lua search()<cr>', options)
map('n', '<4-RightMouse>', ':lua search()<cr>', options)