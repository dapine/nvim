local map = vim.keymap.set
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

require("harpoon").setup()

map("n", "<Leader>m", mark.add_file, {})
map("n", "<Leader>ml", ui.toggle_quick_menu, {})
map("n", "<Leader>u", function() ui.nav_file(1) end, {})
map("n", "<Leader>i", function() ui.nav_file(2) end, {})
map("n", "<Leader>o", function() ui.nav_file(3) end, {})
map("n", "<Leader>p", function() ui.nav_file(4) end, {})
