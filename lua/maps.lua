local map = vim.keymap.set

local function close()
	local buftype = vim.api.nvim_buf_get_option(0, "buftype")
	if buftype == "terminal" then
		vim.cmd("bw!")
	else
		vim.cmd("bw")
	end
end

map("n", "<Space>", "", {})
vim.g.mapleader = " "

local options = { noremap = true }

map("n", "0", "^", options)
map("n", ",", ";", options)
map("n", ";", ":", options)
map("n", "s", "*", options)
map("n", "j", "gj", options)
map("n", "k", "gk", options)
map("n", "n", "nzz", options)
map("n", "N", "Nzz", options)

map("i", "jk", "<esc>", options)
map("i", "<C-d>", "<del>", options)

map("v", "j", "gj", options)
map("v", "k", "gk", options)

map("n", "<Leader>q", close, options)

map("n", "<Leader>j", "<C-f>zz", options)
map("n", "<Leader>k", "<C-b>zz", options)
map("n", "-", "<C-f>zz", options)
map("n", "=", "<C-b>zz", options)
map("v", "-", "<C-f>zz", options)
map("v", "=", "<C-b>zz", options)

map("n", "<BS>", "<C-o>", options)
map("n", "<A-BS>", "<C-i>", options)
