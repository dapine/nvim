local nvim_lsp = require 'lspconfig'
local util = require 'lspconfig/util'
local lsp = require('lsp')

local on_attach = lsp.on_attach
local capabilities = lsp.capabilities

nvim_lsp['pyright'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp['tsserver'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp['elixirls'].setup {
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { os.getenv("HOME") .. "/.cache/nvim/elixir-ls/rel/language_server.sh" }
}

nvim_lsp['svelte'].setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

nvim_lsp['gopls'].setup {
	on_attach = on_attach,
	capabilities = capabilities,
  cmd = {"gopls", "serve"},
  filetypes = {"go", "gomod"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}

nvim_lsp['rust_analyzer'].setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

nvim_lsp['ocamllsp'].setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
