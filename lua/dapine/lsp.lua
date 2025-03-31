vim.lsp.config["lua-language-server"] = {
  cmd = { "lua-language-server" },
  root_markers = { ".luarc.json" },
  filetypes = { "lua" },
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
}

vim.lsp.config["elixir-ls"] = {
  cmd = { vim.fn.expand("$HOME/ls/elixir-ls/language_server.sh") },
  root_markers = { "mix.exs" },
  filetypes = { "elixir" },
}

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})

vim.lsp.enable({ "lua-language-server", "elixir-ls" })
vim.lsp.inlay_hint.enable(true)

vim.diagnostic.config({
  virtual_text = { current_line = true }
})

vim.cmd("set completeopt+=noselect")
