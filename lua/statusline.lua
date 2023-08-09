-- thx to https://nuxsh.is-a.dev/blog/custom-nvim-statusline.html

local M = {}

-- local default_settings = {
--   use_nerd_fonts = false,
-- }

Settings = {
  use_nerd_fonts = false,
}

function M.setup(user_settings)
  local us = user_settings == nil and {} or user_settings
  Settings = vim.tbl_deep_extend("force", Settings, us)
  vim.cmd([[set statusline=%!v:lua.Statusline.active()]])
end

local modes = {
  ["n"] = "NORMAL",
  ["no"] = "NORMAL",
  ["v"] = "VISUAL",
  ["V"] = "VISUAL LINE",
  [""] = "VISUAL BLOCK",
  ["s"] = "SELECT",
  ["S"] = "SELECT LINE",
  [""] = "SELECT BLOCK",
  ["i"] = "INSERT",
  ["ic"] = "INSERT",
  ["R"] = "REPLACE",
  ["Rv"] = "VISUAL REPLACE",
  ["c"] = "COMMAND",
  ["cv"] = "VIM EX",
  ["ce"] = "EX",
  ["r"] = "PROMPT",
  ["rm"] = "MOAR",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  ["t"] = "TERMINAL",
}

local function mode()
  local current_mode = vim.api.nvim_get_mode().mode
  return string.format(" %s ", modes[current_mode]):upper()
end

local function update_mode_colors()
  local current_mode = vim.api.nvim_get_mode().mode
  local mode_color = "%#StatusLineAccent#"
  if current_mode == "n" then
      mode_color = "%#StatuslineAccent#"
  elseif current_mode == "i" or current_mode == "ic" then
      mode_color = "%#StatuslineInsertAccent#"
  elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
      mode_color = "%#StatuslineVisualAccent#"
  elseif current_mode == "R" then
      mode_color = "%#StatuslineReplaceAccent#"
  elseif current_mode == "c" then
      mode_color = "%#StatuslineCmdLineAccent#"
  elseif current_mode == "t" then
      mode_color = "%#StatuslineTerminalAccent#"
  end
  return mode_color
end

local function filepath()
  local fpath = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.:h")
  if fpath == "" or fpath == "." then
      return " "
  end

  return string.format(" %%<%s/", fpath)
end

local function filename()
  local fname = vim.fn.expand "%:t"
  if fname == "" then
      return ""
  end
  return fname .. " "
end

local function lsp()
  local count = {}
  local levels = {
    errors = "Error",
    warnings = "Warn",
    info = "Info",
    hints = "Hint",
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ""
  local warnings = ""
  local hints = ""
  local info = ""

  local error_label = Settings.use_nerd_fonts and " " or "E: "
  local warning_label = Settings.use_nerd_fonts and " " or "W: "
  local hint_label = Settings.use_nerd_fonts and " " or "H: "
  local info_label = Settings.use_nerd_fonts and " " or "I: "

  if count["errors"] ~= 0 then
    errors = table.concat({" %#LspDiagnosticsSignError# ", error_label, count["errors"]})
  end
  if count["warnings"] ~= 0 then
    warnings = table.concat({" %#LspDiagnosticsSignWarning# ", warning_label, count["warnings"]})
  end
  if count["hints"] ~= 0 then
    hints = table.concat({" %#LspDiagnosticsSignHint# ", hint_label, count["hints"]})
  end
  if count["info"] ~= 0 then
    info = table.concat({" %#LspDiagnosticsSignInformation# ", info_label, count["info"]})
  end

  return errors .. warnings .. hints .. info .. "%#Normal#"
end

local function filetype()
  return string.format(" %s ", vim.bo.filetype)
end

local function lineinfo()
  if vim.bo.filetype == "alpha" then
    return ""
  end
  return " %P %l:%c "
end

Statusline = {}

Statusline.active = function()
  return table.concat {
    "%#Statusline#",
    update_mode_colors(),
    mode(),
    "%#Normal# ",
    filepath(),
    filename(),
    "%#Normal#",
    "%=",
    lsp(),
    "%#StatusLineExtra#",
    filetype(),
    lineinfo(),
  }
end

return M
