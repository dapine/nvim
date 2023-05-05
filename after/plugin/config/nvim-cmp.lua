local cmp = require 'cmp'
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local lspkind = require('lspkind')
local theme = require('theme')

local lspkind_format = {
	mode = 'text'
}

if theme.use_nerd_font then
	lspkind_format.mode = 'symbol_text'
end

cmp.setup {
  snippet = {
    expand = function(args)
			require('luasnip').lsp_expand(args.body)
    end,
  },

	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	view = {
		entries = { name = "custom", selection_order = "near_cursor" }
	},

	formatting = {
		format = lspkind.cmp_format(lspkind_format)
	},

	mapping = cmp.mapping.preset.insert({
    ['<A-p>'] = cmp.mapping.select_prev_item(),
    ['<A-n>'] = cmp.mapping.select_next_item(),
    ['<A-d>'] = cmp.mapping.scroll_docs(-4),
    ['<A-f>'] = cmp.mapping.scroll_docs(4),
    ['<A-Space>'] = cmp.mapping.complete(),
		['<A-e>'] = cmp.mapping.close(),
		['<Tab>'] = cmp.mapping.confirm({ select = true }),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
	}),
}

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
