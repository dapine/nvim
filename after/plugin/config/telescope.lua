local ok, _ = pcall(require, 'telescope')

if not ok then
	vim.notify('telescope not loaded')
	return
end

require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "node_modules", "_build", "deps", "target" }
  }
}
