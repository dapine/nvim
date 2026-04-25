local colorscheme = "modus_operandi"

require("plugins")
require("maps")
require("settings")
require("lsp")
require("statusline").setup({
    use_nerd_fonts = true,
    colorscheme = colorscheme
})
require("autocmds")

vim.cmd("colorscheme " .. colorscheme)
