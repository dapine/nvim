local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  sources = {
    diagnostics.checkstyle.with({
      extra_args = { "-c", "/google_checks.xml" },
    }),
    formatting.google_java_format,
  }
})
