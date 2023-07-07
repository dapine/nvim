require("mason").setup {}
require("mason-lspconfig").setup {}

require("mason-lspconfig").setup_handlers {
	function (server_name)
		require("lspconfig")[server_name].setup {}
	end,
	["jdtls"] = function()
		-- use ftplugin/java.lua
	end,
	["lua_ls"] = function()
		-- use ftplugin/lua.lua
	end,
}
