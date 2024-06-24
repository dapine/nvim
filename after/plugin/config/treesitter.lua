require 'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  endwise = {
    enable = true,
  },
  ensure_installed = {
    "rust",
    "lua",
    "javascript",
    "typescript",
    "python",
    "bash",
    "html",
    "css",
    "elixir",
    "eex",
    "heex",
    "java",
    "json",
    "toml",
    "yaml",
  },
}
