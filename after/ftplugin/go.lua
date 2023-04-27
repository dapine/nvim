-- https://cs.opensource.google/go/x/tools/+/refs/tags/gopls/v0.8.3:gopls/doc/vim.md#neovim-imports
function org_imports(wait_ms)
	local params = vim.lsp.util.make_range_params()
	params.context = {only = {"source.organizeImports"}}
	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
	for _, res in pairs(result or {}) do
		for _, r in pairs(res.result or {}) do
			if r.edit then
				vim.lsp.util.apply_workspace_edit(r.edit, "utf-8")
			else
				vim.lsp.buf.execute_command(r.command)
			end
		end
	end
end

vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = { "*.go" },
	callback = function() org_imports(1000) end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = { "*.go" },
	callback = function() vim.lsp.buf.format({ async = false }) end,
})
