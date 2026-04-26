vim.pack.add({ "https://github.com/miikanissi/modus-themes.nvim.git" })
vim.pack.add({ "https://github.com/WTFox/jellybeans.nvim" })
vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim.git" })
vim.pack.add({ "https://github.com/ThePrimeagen/harpoon.git" })
vim.pack.add({ "https://github.com/nvim-mini/mini.nvim.git" })
vim.pack.add({ "https://github.com/stevearc/oil.nvim.git" })
vim.pack.add({ "https://github.com/nvim-lua/plenary.nvim.git" })
vim.pack.add({ { src = "https://github.com/nvim-treesitter/nvim-treesitter.git", version = "master" } })
vim.pack.add({ "https://github.com/RRethy/nvim-treesitter-endwise.git" })
vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })
vim.pack.add({ "https://github.com/f-person/auto-dark-mode.nvim" })

require("gitsigns").setup({
    on_attach = function()
        local gs = package.loaded.gitsigns

        vim.keymap.set("n", "<leader>gb", gs.toggle_current_line_blame)
    end,
})

require("harpoon").setup()

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
require("mini.pairs").setup({})
require("mini.pick").setup()

require("oil").setup({
    keymaps = {
        ["q"] = { "actions.close", mode = "n" },
        ["H"] = { "actions.parent", mode = "n" },
    },
})

require("nvim-treesitter.config").setup({
    highlight = { enable = true },
    indent = { enable = true },
    endwise = { enable = true },
    ensure_installed = { "rust", "lua", "bash", "elixir", "eex", "heex" },
})

require("auto-dark-mode").setup({
    set_dark_mode = function()
        vim.api.nvim_set_option_value("background", "dark", {})
        vim.cmd("colorscheme jellybeans-muted")

        require("statusline").setup({
            use_nerd_fonts = true,
            colorscheme = "jellybeans"
        })
    end,
    set_light_mode = function()
        vim.api.nvim_set_option_value("background", "light", {})
        vim.cmd("colorscheme modus_operandi")
        require("statusline").setup({
            use_nerd_fonts = true,
            colorscheme = "modus_operandi"
        })
    end,
    update_interval = 3000,
    fallback = "light"
})
