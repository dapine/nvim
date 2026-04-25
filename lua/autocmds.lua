vim.api.nvim_create_autocmd("FileType", {
    pattern = { "elixir", "eex", "heex" },
    callback = function()
        vim.treesitter.start()
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})
