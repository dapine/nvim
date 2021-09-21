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

map('v', 'j', 'gj', options)
map('v', 'k', 'gk', options)

map('n', '<A-n>', ':NvimTreeToggle<cr>', options)
map('n', '<Leader>b', ':Buffers<cr>', options)
map('n', '<A-i>', ':bprevious<cr>', options)
map('n', '<A-o>', ':bnext<cr>', options)
map('n', '<Leader>q', ':bw<cr>', options)

map('n', '<A-h>', '<C-w>h', options)
map('n', '<A-j>', '<C-w>j', options)
map('n', '<A-k>', '<C-w>k', options)
map('n', '<A-l>', '<C-w>l', options)

map('n', '<Leader>ff', '<cmd>Telescope find_files<cr>', options)
map('n', '<Leader>fb', '<cmd>Telescope file_browser<cr>', options)
