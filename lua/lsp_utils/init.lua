local Module = {}

function Module.set_default_mappings(buffer)
	local options = { noremap = true, silent = true }

	vim.api.nvim_buf_set_keymap(buffer, 'n', '<leader>lgd', '<Cmd>lua vim.lsp.buf.definition()<CR>', options)
	vim.api.nvim_buf_set_keymap(buffer, 'n', '<leader>lgD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', options)
	vim.api.nvim_buf_set_keymap(buffer, 'n', '<leader>lgi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', options)
	vim.api.nvim_buf_set_keymap(buffer, 'n', '<leader>lgr', '<Cmd>lua vim.lsp.buf.references()<CR>', options)

	vim.api.nvim_buf_set_keymap(buffer, 'n', '<leader>lft', '<Cmd>lua vim.lsp.buf.format()<CR>', options)
	vim.api.nvim_buf_set_keymap(buffer, 'n', '<leader>lrn', '<Cmd>lua vim.lsp.buf.rename()<CR>', options)
	vim.api.nvim_buf_set_keymap(buffer, 'n', '<leader>lca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', options)

	vim.api.nvim_buf_set_keymap(buffer, 'n', '<leader>lh', '<Cmd>lua vim.lsp.buf.hover()<CR>', options)
	vim.api.nvim_buf_set_keymap(buffer, 'i', '<C-S>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', options)
	vim.api.nvim_buf_set_keymap(buffer, 'n', '<leader>D', '<Cmd>lua vim.diagnostic.open_float()<CR>', options)
end

function Module.set_default_configs(buffer)
	Module.set_default_mappings(buffer)
end

return Module
