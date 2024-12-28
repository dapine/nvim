require("mason").setup({})
require("mason-lspconfig").setup({})
local map = vim.keymap.set

require("mason-lspconfig").setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({})
	end,
	["jdtls"] = function()
		-- use ftplugin/java.lua
	end,
	["lua_ls"] = function()
		-- use ftplugin/lua.lua
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("LspKeymaps", {}),
	callback = function(args)
		vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		local opts = { buffer = args.buf }
		map("n", "gD", vim.lsp.buf.declaration, opts)
		map("n", "gd", vim.lsp.buf.definition, opts)
		map("n", "K", vim.lsp.buf.hover, opts)
		map("n", "gi", vim.lsp.buf.implementation, opts)
		map("n", "gr", function()
			require("telescope.builtin").lsp_references()
		end, opts)
		map("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
		map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
		map("n", "<leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		map("n", "<leader>D", vim.lsp.buf.type_definition, opts)
		map("n", "<leader>rn", vim.lsp.buf.rename, opts)
		map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		map("n", "<leader>so", require("telescope.builtin").lsp_document_symbols, opts)
		vim.api.nvim_create_user_command("Format", function()
			vim.lsp.buf.format({ async = true })
		end, {})
		map("n", "[d", vim.diagnostic.goto_prev, opts)
		map("n", "]d", vim.diagnostic.goto_next, opts)
		map("n", "<leader>d", require("telescope.builtin").diagnostics, opts)
		map("n", "<leader>h", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, opts)

		if client.server_capabilities.signatureHelpProvider then
			map("n", "<Leader>s", vim.lsp.buf.signature_help, { noremap = true })
		end
	end,
})
