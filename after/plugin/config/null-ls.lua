local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
  sources = {
    diagnostics.checkstyle.with({
      extra_args = { "-c", "/google_checks.xml" },
    }),
    formatting.google_java_format,
    code_actions.eslint_d,
    diagnostics.eslint_d,
    formatting.prettierd,
    formatting.mix,
    diagnostics.credo,
  }
})
