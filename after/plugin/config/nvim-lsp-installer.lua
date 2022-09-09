local ok, _ = pcall(require, 'nvim-lsp-installer')

if not ok then
	vim.notify('nvim-lsp-installer not loaded')
	return
end

require("nvim-lsp-installer").setup {}
