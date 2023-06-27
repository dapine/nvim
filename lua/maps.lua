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

map('n', '<Leader>j', '<C-f>zz', options)
map('n', '<Leader>k', '<C-b>zz', options)

map('n', '<Leader>ff', require('telescope.builtin').find_files, options)
map('n', '<Leader>gr', search_with_cache, options)
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

local telescope = require('telescope.builtin')
local telescope_state = require('telescope.state')

local last_search = nil

local function search_with_cache()
  if last_search == nil then
    telescope.live_grep()

    local cached_pickers = telescope_state.get_global_key "cached_pickers" or {}
    last_search = cached_pickers[1]
  else
    telescope.resume({ picker = last_search })
  end
end
