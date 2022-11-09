local ok_mason, _ = pcall(require, 'mason')
local ok_mason_lspconfig, _ = pcall(require, 'mason-lspconfig')

if not ok_mason then
	vim.notify('mason.nvim not loaded')
	return
end

if not ok_mason_lspconfig then
	vim.notify('mason-lspconfig.nvim not loaded')
	return
end

require("mason").setup {}
require("mason-lspconfig").setup {}
