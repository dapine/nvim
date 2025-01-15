return {
	"elixir-tools/elixir-tools.nvim",
	version = "*",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("elixir").setup({
			nextls = { enable = false },
			credo = { enable = false },
			elixirls = { enable = true },
		})
	end,
}
