local JDTLS_LOCATION = vim.fn.stdpath "data" .. "/mason/bin/jdtls"
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }

local config = {
	cmd = { JDTLS_LOCATION },
	root_dir = vim.fs.dirname(vim.fs.find(root_markers, { upward = true })[1]),
}

require('jdtls').start_or_attach(config)
