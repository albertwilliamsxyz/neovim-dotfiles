-- Imports

local lsp_utils = require('lsp_utils')

-- Visual and tabs

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- LSP

local buffer = vim.api.nvim_get_current_buf()
local root_dir = vim.fs.root(buffer, { '.git', '.env', 'requirements.txt' })

vim.lsp.start({
	name = 'pyright-langserver',
	cmd = { 'pyright-langserver', '--stdio' },
	root_dir = root_dir,
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = 'openFilesOnly',
			},
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

local luasnip = require('luasnip')
local snippet = luasnip.snippet
local text_node = luasnip.text_node
local insert_node = luasnip.insert_node

print('Configuration for python loaded successfully')
