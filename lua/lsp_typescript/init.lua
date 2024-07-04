-- Imports

local lsp_utils = require('lsp_utils')

-- Visual and tabs

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- LSP

local buffer = vim.api.nvim_get_current_buf()

vim.lsp.start({
	name = 'typescript-language-server',
	cmd = { 'typescript-language-server', '--stdio' },
	root_dir = vim.fs.dirname(vim.fs.find({ 'package.json', '.git' }, { upward = true })[0]),
})

lsp_utils.set_default_configs(buffer)

-- Functions

local function format_buffer()
	vim.lsp.buf.format({ async = false })
end

-- Autocommands / Autogroups

vim.api.nvim_create_autocmd({ 'InsertLeave', 'BufWritePre' }, {
	buffer = buffer,
	callback = format_buffer,
})

print('Configuration for tsx loaded successfully')
