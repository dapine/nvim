vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = { "*.go" },
	command = 'lua local goimport = require "goimport"; goimport.org_imports(1000)',
})

vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = { "*.go" },
	command = 'lua vim.lsp.buf.formatting_sync(nil, 1000)',
})
