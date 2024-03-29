vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = { "*.rs" },
	callback = function() vim.lsp.buf.format { async = false, timeout = 1000 } end,
})

function cargo_run()
	vim.cmd("set makeprg=cargo\\ run\\ --message-format=short")
	vim.cmd("make")
end

function cargo_build()
	vim.cmd("set makeprg=cargo\\ build\\ --message-format=short")
	vim.cmd("make")
end

vim.api.nvim_create_user_command("CargoRun", cargo_run, {})
vim.api.nvim_create_user_command("CargoBuild", cargo_build, {})
