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
o.laststatus = 3
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

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript",
              "javascriptreact", "typescriptreact",
              "svelte",
              "html", "xml",
              "elixir",
              "lua",
            },
  command = "setlocal shiftwidth=2 tabstop=2",
})
