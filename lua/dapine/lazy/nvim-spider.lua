return {
	"chrisgrieser/nvim-spider",
	config = function()
		local map = vim.keymap.set
		local spider = require("spider")

		map({ "n", "o", "x" }, "w", function()
			spider.motion("w")
		end, { desc = "Spider-w" })
		map({ "n", "o", "x" }, "e", function()
			spider.motion("e")
		end, { desc = "Spider-e" })
		map({ "n", "o", "x" }, "b", function()
			spider.motion("b")
		end, { desc = "Spider-b" })
		map({ "n", "o", "x" }, "ge", function()
			spider.motion("ge")
		end, { desc = "Spider-ge" })
	end,
}
