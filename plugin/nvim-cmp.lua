local cmp = require 'cmp'

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

	mapping = cmp.mapping.preset.insert({
    ['<A-p>'] = cmp.mapping.select_prev_item(),
    ['<A-n>'] = cmp.mapping.select_next_item(),
    ['<A-d>'] = cmp.mapping.scroll_docs(-4),
    ['<A-f>'] = cmp.mapping.scroll_docs(4),
    ['<A-Space>'] = cmp.mapping.complete(),
		['<A-e>'] = cmp.mapping.close(),
		['<Tab>'] = cmp.mapping.confirm({ select = true }),
	}),

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
	}),
}