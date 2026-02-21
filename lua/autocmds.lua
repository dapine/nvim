vim.api.nvim_create_autocmd("FileType", {
	pattern = { "elixir", "eex", "heex" },
	callback = function()
		vim.treesitter.start()
	end,
})
