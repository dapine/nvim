-- copied from nvim-lspconfig
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls

require("lspconfig").lua_ls.setup({
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
			client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
						},
					},
					diagnostics = {
						globals = { "vim" },
					},
				},
			})

			client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
		end
		return true
	end,
})
