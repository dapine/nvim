local map = vim.keymap.set

map("n", "<Space>", "", {})
vim.g.mapleader = " "

map("n", "0", "^")
map("n", ",", ";")
map("n", ";", ":")
map("n", "s", "*")

map("i", "jk", "<esc>")
map("i", "<C-d>", "<del>")

vim.keymap.set({ "n", "x" }, "j", function()
	return vim.v.count > 0 and "j" or "gj"
end, { noremap = true, expr = true })
vim.keymap.set({ "n", "x" }, "k", function()
	return vim.v.count > 0 and "k" or "gk"
end, { noremap = true, expr = true })

map({ "n", "v" }, "-", "<C-f>", { noremap = true })
map({ "n", "v" }, "=", "<C-b>", { noremap = true })

map("n", "<BS>", "<C-o>")
map("n", "<A-BS>", "<C-i>")

vim.keymap.set("n", "<Leader>m", require("harpoon.mark").add_file, {})
vim.keymap.set("n", "<Leader>ml", require("harpoon.ui").toggle_quick_menu, {})
vim.keymap.set("n", "<Leader>u", function()
	require("harpoon.ui").nav_file(1)
end, {})
vim.keymap.set("n", "<Leader>i", function()
	require("harpoon.ui").nav_file(2)
end, {})
vim.keymap.set("n", "<Leader>o", function()
	require("harpoon.ui").nav_file(3)
end, {})
vim.keymap.set("n", "<Leader>p", function()
	require("harpoon.ui").nav_file(4)
end, {})

local spider = require("spider")
vim.keymap.set({ "n", "o", "x" }, "w", function()
	spider.motion("w")
end, { desc = "Spider-w" })
vim.keymap.set({ "n", "o", "x" }, "e", function()
	spider.motion("e")
end, { desc = "Spider-e" })
vim.keymap.set({ "n", "o", "x" }, "b", function()
	spider.motion("b")
end, { desc = "Spider-b" })
vim.keymap.set({ "n", "o", "x" }, "ge", function()
	spider.motion("ge")
end, { desc = "Spider-ge" })

vim.keymap.set("n", "<Leader>fb", "<CMD>Oil<CR>")

vim.keymap.set("n", "<Leader>ff", require("telescope.builtin").find_files, { noremap = true })
vim.keymap.set("n", "<Leader>gr", require("telescope.builtin").live_grep, { noremap = true })
vim.keymap.set("n", "<Leader>b", require("telescope.builtin").buffers, { noremap = true })
