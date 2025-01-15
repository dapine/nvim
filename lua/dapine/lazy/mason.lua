return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end,
	},
	{ "neovim/nvim-lspconfig" },
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({})
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
				["lua_ls"] = function()
					-- use ftplugin/lua.lua
				end,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("LspKeymaps", {}),
				callback = function(args)
					local map = vim.keymap.set
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
					map("n", "<leader>D", vim.lsp.buf.type_definition, opts)
					map("n", "<leader>rn", vim.lsp.buf.rename, opts)
					map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
					map("n", "<leader>so", require("telescope.builtin").lsp_document_symbols, opts)
					vim.api.nvim_create_user_command("Format", function()
						vim.lsp.buf.format({ async = true })
					end, {})
					map("n", "<leader>d", require("telescope.builtin").diagnostics, opts)
					map("n", "<leader>h", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
					end, opts)

					if client.server_capabilities.signatureHelpProvider then
						map("n", "<Leader>s", vim.lsp.buf.signature_help, { noremap = true })
					end
				end,
			})
		end,
	},
}
