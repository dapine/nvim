local ls = require("luasnip")

ls.add_snippets("java", {
	ls.parser.parse_snippet('sout', 'System.out.println(${0});')
})
