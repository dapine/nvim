vim.lsp.config["lua-language-server"] = {
	cmd = { "lua-language-server" },
	root_markers = { ".luarc.json" },
	filetypes = { "lua" },
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
}

vim.lsp.config["expert"] = {
	cmd = { vim.fn.expand("$HOME/.local/bin/expert") },
	root_markers = { "mix.exs", ".git" },
	filetypes = { "elixir", "eelixir", "heex" },
}

vim.lsp.config["gopls"] = {
	cmd = { "gopls" },
	root_markers = { "go.mod" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
}

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function()
		vim.keymap.set("n", "grd", vim.lsp.buf.definition, {})
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist, {})
	end,
})

vim.lsp.enable({ "lua-language-server", "expert", "gopls" })
