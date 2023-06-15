local ls = require("luasnip")

ls.add_snippets("java", {
	ls.parser.parse_snippet('sout', 'System.out.println(${0});')
})

ls.add_snippets("javascript", {
	ls.parser.parse_snippet('cl', 'console.log(${0})'),
	ls.parser.parse_snippet('map', '${1}.map(${2} => ${3})'),
	ls.parser.parse_snippet('filter', '${1}.filter(${2} => ${3})'),
	ls.parser.parse_snippet('reduce', '${1}.reduce((acc, ${2}) => ${3}, ${4})'),
	ls.parser.parse_snippet('function', 'function ${1}(${2}) {${3}}'),
})
ls.filetype_extend("typescript", {"javascript"})
ls.filetype_extend("javascriptreact", {"javascript"})
ls.filetype_extend("typescriptreact", {"javascript"})
