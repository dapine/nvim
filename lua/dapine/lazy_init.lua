local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",

		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local opts = {
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
	defaults = {
		lazy = true,
	},
}

require("lazy").setup({
	spec = "dapine.lazy",
	change_detection = { notify = false },
}, opts)
