local map = vim.keymap.set

map('n', '<Space>', '', {})
vim.g.mapleader = ' '

local options = { noremap = true }

map('n', '0', '^', options)
map('n', ',', ';', options)
map('n', ';', ':', options)
map('n', 's', '*', options)
map('n', 'j', 'gj', options)
map('n', 'k', 'gk', options)
map('n', 'n', 'nzz', options)
map('n', 'N', 'Nzz', options)

map('i', 'jk', '<esc>', options)
map('i', '<C-d>', '<del>', options)

map('v', 'j', 'gj', options)
map('v', 'k', 'gk', options)

map('n', '<Leader>q', ':bw<cr>', options)

map('n', '<Leader>j', '<C-f>zz', options)
map('n', '<Leader>k', '<C-b>zz', options)
map('n', '-', '<C-f>zz', options)
map('n', '=', '<C-b>zz', options)

map('n', '<Leader>ff', require('telescope.builtin').find_files, options)
map('n', '<Leader>gr', require('telescope.builtin').live_grep, options)
map('n', '<Leader>fb', '<cmd>NnnPicker %:p:h<cr>', options)

map('n', '<Tab>', ':bnext<cr>', options)
map('n', '<Leader><Tab>', ':bprevious<cr>', options)

-- Acme-like go to next word occurrence.
-- Maybe add a plumbing mechanism in the future?
local function search()
  vim.api.nvim_input('*')
end

map('n', '<RightMouse>', search, options)
map('n', '<2-RightMouse>', search, options)
map('n', '<3-RightMouse>', search, options)
map('n', '<4-RightMouse>', search, options)

-- nvim-spider
map({"n", "o", "x"}, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
map({"n", "o", "x"}, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
map({"n", "o", "x"}, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
map({"n", "o", "x"}, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('LspKeymaps', {}),
  callback = function(args)
    vim.bo[args.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    local opts = { buffer = args.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>so', require('telescope.builtin').lsp_document_symbols, opts)
		vim.api.nvim_create_user_command('Format', function() vim.lsp.buf.format { async = true } end, {})
		vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
		vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<leader>d', require('telescope.builtin').diagnostics, opts)

    if client.server_capabilities.signatureHelpProvider then
      map('n', '<Leader>s', vim.lsp.buf.signature_help, options)
    end
  end,
})
