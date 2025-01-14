return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			keymaps = {
				["q"] = { "actions.close", mode = "n" },
				["H"] = { "actions.parent", mode = "n" },
			},
		})

		vim.keymap.set("n", "<Leader>fb", "<CMD>Oil<CR>", {})
	end,
}
