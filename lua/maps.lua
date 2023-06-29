local map = vim.keymap.set

-- https://github.com/nvim-telescope/telescope.nvim/issues/2024#issuecomment-1580229786
local telescope = require('telescope.builtin')
local telescope_last = 0
function telescope_resume()
  if telescope_last == 0 then
    telescope_last = 1
    telescope.live_grep()
  else
    telescope.resume()
  end
end

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

map('n', '<Leader>j', '<C-f>zz', options)
map('n', '<Leader>k', '<C-b>zz', options)

map('n', '<Leader>ff', require('telescope.builtin').find_files, options)
map('n', '<Leader>gr', telescope_resume, options)
map('n', '<Leader>fb', '<cmd>NnnPicker %:p:h<cr>', options)

map('n', '<Tab>', ':bnext<cr>', options)
map('n', '<Leader><Tab>', ':bprevious<cr>', options)

-- Acme-like go to next word occurrence.
-- Maybe add a plumbing mechanism in the future?
local function search()
  vim.api.nvim_input('*')
end

map('n', '<RightMouse>', search, options)
map('n', '<2-RightMouse>', search, options)
map('n', '<3-RightMouse>', search, options)
map('n', '<4-RightMouse>', search, options)

-- nvim-spider
map({"n", "o", "x"}, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
map({"n", "o", "x"}, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
map({"n", "o", "x"}, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
map({"n", "o", "x"}, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })
