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
