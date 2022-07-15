local nvim_lsp = require 'lspconfig'
local capabilities = vim.lsp.protocol.make_client_capabilities()
local util = require 'lspconfig/util'

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

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

vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = { "*.go" },
	command = 'lua local goimport = require "goimport"; goimport.org_imports(1000)',
})

vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = { "*.go", "*.ex", "*.exs", "*.rs" },
	command = 'lua vim.lsp.buf.formatting_sync(nil, 1000)',
})

nvim_lsp['ocamllsp'].setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

-- nvim-cmp setup
local cmp = require 'cmp'

cmp.setup {
  snippet = {
    expand = function(args)
			require('luasnip').lsp_expand(args.body)
    end,
  },

	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	mapping = cmp.mapping.preset.insert({
    ['<A-p>'] = cmp.mapping.select_prev_item(),
    ['<A-n>'] = cmp.mapping.select_next_item(),
    ['<A-d>'] = cmp.mapping.scroll_docs(-4),
    ['<A-f>'] = cmp.mapping.scroll_docs(4),
    ['<A-Space>'] = cmp.mapping.complete(),
		['<A-e>'] = cmp.mapping.close(),
		['<Tab>'] = cmp.mapping.confirm({ select = true }),
	}),

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
	}),
}
