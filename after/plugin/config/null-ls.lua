local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
  sources = {
    -- node
    code_actions.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ "package.json", "package-lock.json" })
      end,
    }),
    diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ "package.json", "package-lock.json" })
      end,
    }),
    formatting.prettierd.with({
      condition = function(utils)
        return utils.root_has_file({ "package.json", "package-lock.json" })
      end,
    }),
    -- deno
    diagnostics.deno_lint.with({
      condition = function(utils)
        return utils.root_has_file({ "deno.json", "deno.lock" })
      end,
    }),
    formatting.deno_fmt.with({
      condition = function(utils)
        return utils.root_has_file({ "deno.json", "deno.lock" })
      end,
    }),
    -- elixir
    formatting.mix,
    diagnostics.credo,
  }
})
