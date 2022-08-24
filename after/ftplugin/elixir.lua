vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = { "*.ex", "*.exs" },
	command = 'lua vim.lsp.buf.formatting_sync(nil, 1000)',
})

-- vim-comment
vim.api.nvim_create_autocmd('FileType', {
	pattern = { "elixir" },
	command = [[setlocal commentstring=#\ %s]],
})
