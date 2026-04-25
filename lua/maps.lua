local map = vim.keymap.set

map("n", "<Space>", "", {})
vim.g.mapleader = " "

map("n", "0", "^")

map("i", "jk", "<esc>")
map("i", "<C-d>", "<del>")

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

vim.keymap.set("n", "<Leader>fb", "<CMD>Oil<CR>")

vim.keymap.set("n", "<Leader>ff", "<CMD>Pick files tool='git'<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>gr", "<CMD>Pick grep_live tool='rg'<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>b", "<CMD>Pick buffers<CR>", { noremap = true })
