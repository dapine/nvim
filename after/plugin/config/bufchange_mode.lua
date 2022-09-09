local ok, _ = pcall(require, 'bufchange_mode')

if not ok then
	vim.notify('bufchange_mode not loaded')
	return
end

require('bufchange_mode').setup()
