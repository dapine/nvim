local o = vim.o
local wo = vim.wo
local bo = vim.bo

local colorscheme = os.getenv("NVIM_COLORSCHEME")
colorscheme = colorscheme == nil and "default" or colorscheme

o.shiftwidth = 4
o.tabstop = 4
o.expandtab = true
o.autoindent = true
o.smartindent = true

o.backspace = "indent,eol,start"
o.swapfile = false
o.scrolloff = 10
o.sidescrolloff = 5
o.encoding = "utf-8"
o.smartcase = true
o.lazyredraw = true
o.laststatus = 3
o.wildignore = [[*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.hi,*.o,*/node_modules/*,*/deps/*,*/_build/*,*.cmi,*cmo]]
o.splitbelow = true
o.splitright = true
o.clipboard = "unnamedplus"

vim.o.completeopt = "menuone,noselect"

wo.cursorline = false
wo.cursorcolumn = false

o.mouse = "a"

-- Visual
o.showmatch = true
o.number = true
o.relativenumber = true
o.ch = 1
o.showmode = false
vim.opt.termguicolors = true
vim.cmd("colorscheme " .. colorscheme)

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

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0

vim.o.updatetime = 200
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end
})

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  update_in_insert = false,
})
