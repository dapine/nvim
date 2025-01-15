return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.trailspace").setup()
		require("mini.surround").setup({
			mappings = {
				add = "S",
			},
		})
		require("mini.indentscope").setup({
			draw = {
				animation = require("mini.indentscope").gen_animation.none(),
			},
			symbol = "┊",
		})
	end,
}
