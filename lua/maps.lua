local map = vim.keymap.set

map('n', '<Space>', '', {})
vim.g.mapleader = ' '

local options = { noremap = true }

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

map('n', '<Leader>q', ':bw<cr>', options)

map('n', '<Leader>j', '<C-f>', options)
map('n', '<Leader>k', '<C-b>', options)

map('n', '<A-h>', '<C-w>h', options)
map('n', '<A-j>', '<C-w>j', options)
map('n', '<A-k>', '<C-w>k', options)
map('n', '<A-l>', '<C-w>l', options)

map('n', '<Leader>ff', '<cmd>Telescope find_files<cr>', options)
map('n', '<Leader>gr', '<cmd>Telescope live_grep<cr>', options)
map('n', '<Leader>fb', '<cmd>NnnPicker %:p:h<cr>', options)

map('n', '<Tab>', ':bnext<cr>', options)
map('n', '<Leader><Tab>', ':bprevious<cr>', options)

-- Acme-like go to next word occurrence.
-- Maybe add a plumbing mechanism in the future?
function search()
  vim.api.nvim_input('*')
end

map('n', '<RightMouse>', ':lua search()<cr>', options)
map('n', '<2-RightMouse>', ':lua search()<cr>', options)
map('n', '<3-RightMouse>', ':lua search()<cr>', options)
map('n', '<4-RightMouse>', ':lua search()<cr>', options)
