vim.api.nvim_create_autocmd("LspAttach", {
    callback = function()
        vim.keymap.set("n", "grd", vim.lsp.buf.definition, {})
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
        vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist, {})
    end,
})

vim.lsp.enable({ "lua_ls", "expert", "gopls", "clangd", "rust_analyzer" })
