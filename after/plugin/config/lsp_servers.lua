local nvim_lsp_ok, _ = pcall(require, 'lspconfig')
local util_ok, _ = pcall(require, 'lspconfig/util')
local my_lsp_ok, _ = pcall(require, 'lsp')

if not nvim_lsp_ok then
	vim.notify('lspconfig not loaded')
	return
end
if not util_ok then
	vim.notify('lspconfig/util not loaded')
	return
end
if not my_lsp_ok then
	vim.notify('my lsp not loaded')
	return
end

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
	cmd = { vim.fn.stdpath("data") .. "/mason/bin/elixir-ls" }
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
