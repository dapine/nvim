local home = os.getenv("HOME")
local workspace = os.getenv("JAVA_WORKSPACE")
local mason_path = vim.fn.stdpath("data") .. "/mason/"

if workspace == nil then
	workspace = home .. "/workspace/"
end

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local project_in_workspace = workspace .. project_name
local system = "linux"

local config = {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-javaagent:" .. mason_path .. "packages/jdtls/lombok.jar",
		"-Xms1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-jar",
		vim.fn.glob(mason_path .. "packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
		"-configuration",
		mason_path .. "packages/jdtls/config_" .. system,
		"-data",
		project_in_workspace,
	},
	root_dir = vim.fs.dirname(vim.fs.find(root_markers, { upward = true })[1]),
	settings = {
		java = {
			eclipse = {
				downloadSources = true,
			},
			configuration = {
				updateBuildConfiguration = "interactive",
			},
			maven = {
				downloadSources = true,
			},
			implementationsCodeLens = {
				enabled = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			references = {
				includeDecompiledSources = true,
			},
			format = {
				enabled = true,
			}
		},
		signatureHelp = { enabled = true },
		completion = {
			favoriteStaticMembers = {
				"org.hamcrest.MatcherAssert.assertThat",
				"org.hamcrest.Matchers.*",
				"org.hamcrest.CoreMatchers.*",
				"org.junit.jupiter.api.Assertions.*",
				"java.util.Objects.requireNonNull",
				"java.util.Objects.requireNonNullElse",
				"org.mockito.Mockito.*",
			},
		},
	}
}

require('jdtls').start_or_attach(config)

vim.keymap.set('n', '<leader>oo', require('jdtls').organize_imports, { noremap = true })
