local ls = require("luasnip")

ls.add_snippets("java", {
	ls.parser.parse_snippet("sout", "System.out.println(${0});"),
	ls.parser.parse_snippet(
		"javadoc",
		"/**\
 * ${1}\
 *\
 * @param ${2} \
 * @return ${3} \
 * @throws ${4} \
 */"
	),
	ls.parser.parse_snippet("main", "public static void main(String[] args) {${1}}"),
	ls.parser.parse_snippet("au", "@Autowired"),
})

ls.add_snippets("javascript", {
	ls.parser.parse_snippet("cl", "console.log(${0})"),
	ls.parser.parse_snippet("map", "${1}.map(${2} => ${3})"),
	ls.parser.parse_snippet("filter", "${1}.filter(${2} => ${3})"),
	ls.parser.parse_snippet("reduce", "${1}.reduce((acc, ${2}) => ${3}, ${4})"),
	ls.parser.parse_snippet("function", "function ${1}(${2}) {${3}}"),
})
ls.filetype_extend("typescript", { "javascript" })
ls.filetype_extend("javascriptreact", { "javascript" })
ls.filetype_extend("typescriptreact", { "javascript" })

ls.add_snippets("go", {
	ls.parser.parse_snippet(
		"herr",
		"if err != nil {\
    log.${1}\
}"
	),
	ls.parser.parse_snippet(
		"ierr",
		"if err := ${1}; err != nil {\
    log.${2}\
}"
	),
})
