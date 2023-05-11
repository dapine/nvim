vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = { "*.ex", "*.exs" },
	callback = function() vim.lsp.buf.format { async = false, timeout = 1000 } end,
})

-- vim-comment
vim.api.nvim_create_autocmd('FileType', {
	pattern = { "elixir" },
	callback = function() vim.lsp.buf.format { async = false, timeout = 1000 } end,
})
