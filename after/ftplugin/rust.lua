vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = { "*.rs" },
	command = 'lua vim.lsp.buf.formatting_sync(nil, 1000)',
})
