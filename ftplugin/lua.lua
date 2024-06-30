-- Imports

local lsp_utils = require('lsp_utils')

-- Visual and tabs

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- LSP

local buffer = vim.api.nvim_get_current_buf()

vim.lsp.start({
	name = 'lua-language-server',
	cmd = { 'lua-language-server' },
	root_dir = vim.fs.dirname(vim.fs.find({ 'init.lua', '.git' }, { upward = true })[0]),
	settings = {
		Lua = {
			runtime = { version = 'Lua 5.4', path = package.path, },
			workspace = { library = { [vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true, }, },
			telemetry = { enable = false },
		},
	},
})

lsp_utils.set_default_configs(buffer)

local function format_buffer()
	vim.lsp.buf.format({ async = false })
end

vim.api.nvim_create_autocmd({ 'InsertLeave', 'BufWritePre' }, {
	buffer = buffer,
	callback = format_buffer,
})

print('Configuration for lua loaded successfully')
