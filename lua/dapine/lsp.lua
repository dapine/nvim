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

vim.lsp.config["elixir-ls"] = {
	cmd = { vim.fn.expand("$HOME/ls/elixir-ls/language_server.sh") },
	root_markers = { "mix.exs" },
	filetypes = { "elixir" },
}

local function feedkeys(keys)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, false, true), "n", true)
end

local function pumvisible()
	return tonumber(vim.fn.pumvisible()) ~= 0
end

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method("textDocument/completion") then
			-- ref: https://gist.github.com/MariaSolOs/2e44a86f569323c478e5a078d0cf98cc
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })

			vim.keymap.set("i", "<cr>", function()
				return pumvisible() and "<C-y>" or "<cr>"
			end, { expr = true })

			vim.keymap.set("i", "/", function()
				return pumvisible() and "<C-e>" or "/"
			end, { expr = true })

			vim.keymap.set("i", "<A-n>", function()
				if pumvisible() then
					feedkeys("<C-n>")
				else
					if next(vim.lsp.get_clients({ bufnr = 0 })) then
						vim.lsp.completion.get()
					else
						if vim.bo.omnifunc == "" then
							feedkeys("<C-x><C-n>")
						else
							feedkeys("<C-x><C-o>")
						end
					end
				end
			end, { expr = true })

			vim.keymap.set("i", "<A-p>", function()
				if pumvisible() then
					feedkeys("<C-p>")
				else
					if next(vim.lsp.get_clients({ bufnr = 0 })) then
						vim.lsp.completion.get()
					else
						if vim.bo.omnifunc == "" then
							feedkeys("<C-x><C-p>")
						else
							feedkeys("<C-x><C-o>")
						end
					end
				end
			end, { expr = true })
		end
	end,
})

vim.lsp.enable({ "lua-language-server", "elixir-ls" })
vim.lsp.inlay_hint.enable(true)

vim.diagnostic.config({
	virtual_text = { current_line = true },
})

vim.cmd("set completeopt+=menuone,noselect,popup")
