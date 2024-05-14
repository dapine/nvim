local function cargo_run()
  vim.cmd("set makeprg=cargo\\ run\\ --message-format=short")
  vim.cmd("make")
end

local function cargo_build()
  vim.cmd("set makeprg=cargo\\ build\\ --message-format=short")
  vim.cmd("make")
end

vim.api.nvim_create_user_command("CargoRun", cargo_run, {})
vim.api.nvim_create_user_command("CargoBuild", cargo_build, {})
