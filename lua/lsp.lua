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
	cmd = { vim.fn.expand("$HOME/.local/bin/expert"), "--stdio" },
	root_markers = { "mix.exs", ".git" },
	filetypes = { "elixir", "eelixir", "heex" },
}

vim.lsp.config["gopls"] = {
	cmd = { "gopls" },
	root_markers = { "go.mod" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
}

vim.lsp.config["clangd"] = {
	cmd = { "clangd" },
	root_markers = {
		".clangd",
		".clang-tidy",
		".clang-format",
		"compile_commands.json",
		"compile_flags.txt",
		"configure.ac",
		".git",
	},
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
}

vim.lsp.config["rust-analyzer"] = {
	cmd = { "rust-analyzer" },
	root_markers = {
		".git",
		"Cargo.toml",
	},
	filetypes = { "rust" },
	settings = {
		["rust-analyzer"] = {
			check = { command = "clippy" },
			cargo = { targetDir = true },
			rustc = { source = "discover" },
			inlayHints = {
				bindingModeHints = { enabled = true },
				closureCaptureHints = { enabled = true },
				closureReturnTypeHints = { enable = "always" },
				maxLength = 80,
			},
		},
	},
}

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function()
		vim.keymap.set("n", "grd", vim.lsp.buf.definition, {})
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist, {})
	end,
})

vim.lsp.enable({ "lua-language-server", "expert", "gopls", "clangd", "rust-analyzer" })
