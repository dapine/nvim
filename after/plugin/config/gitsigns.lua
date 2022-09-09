local ok, _ = pcall(require, 'gitsigns')

if not ok then
	vim.notify('gitsigns not loaded')
	return
end

require('gitsigns').setup()
