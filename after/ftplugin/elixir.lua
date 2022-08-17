vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = { "*.ex", "*.exs" },
	command = 'lua vim.lsp.buf.formatting_sync(nil, 1000)',
})
