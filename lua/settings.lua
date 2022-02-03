local o = vim.o
local wo = vim.wo
local bo = vim.bo

local theme = require "theme"

bo.shiftwidth = 4
bo.tabstop = 4
bo.expandtab = true
bo.autoindent = true
bo.smartindent = true

o.backspace = "indent,eol,start"
o.backup = false
o.writebackup = false
o.swapfile = false
o.scrolloff = 10
o.sidescrolloff = 5
o.encoding = "utf-8"
o.hlsearch = true
o.incsearch = true
o.smartcase = true
o.lazyredraw = true
o.laststatus = 2
o.wildignore = [[*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.hi,*.o,*/node_modules/*,*/deps/*,*/_build/*,*.cmi,*cmo]]
o.splitbelow = true
o.splitright = true
o.hidden = true

vim.o.completeopt = "menuone,noselect"

wo.cursorline = false
wo.cursorcolumn = false

o.mouse = "a"

-- Visual
bo.syntax = "on"
vim.opt.termguicolors = true
o.showmatch = true
o.background = theme.background
vim.cmd("colorscheme " .. theme.colorscheme)
o.number = true
o.relativenumber = true

vim.api.nvim_command('autocmd FileType javascriptreact setlocal shiftwidth=2 tabstop=2')
vim.api.nvim_command('autocmd FileType javascript setlocal shiftwidth=2 tabstop=2')
vim.api.nvim_command('autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2')
vim.api.nvim_command('autocmd FileType typescript setlocal shiftwidth=2 tabstop=2')
vim.api.nvim_command('autocmd FileType svelte setlocal shiftwidth=2 tabstop=2')
vim.api.nvim_command('autocmd FileType html setlocal shiftwidth=2 tabstop=2')
vim.api.nvim_command('autocmd FileType xml setlocal shiftwidth=2 tabstop=2')
vim.api.nvim_command('autocmd FileType elixir setlocal shiftwidth=2 tabstop=2')
vim.api.nvim_command('autocmd FileType lua setlocal shiftwidth=2 tabstop=2')
