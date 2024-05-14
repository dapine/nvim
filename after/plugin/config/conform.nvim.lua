require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    elixir = { "mix" },
    go = { "goimports-reviser", "golines" },
    rust = { "rustfmt" },
  },
  format_on_save = {
    timeout_ms = 5000,
    lsp_fallback = true,
  }
})
