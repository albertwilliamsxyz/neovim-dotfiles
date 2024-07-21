-- Imports

local lsp_utils = require('lsp_utils')

local Module = {}

function Module.set_default_configs()
  vim.opt.tabstop = 2
  vim.opt.softtabstop = 2
  vim.opt.shiftwidth = 2

  local root_paths = vim.fs.find({ 'package.json', 'package-lock.json', '.git' }, { upward = true })
  local root_path = root_paths[1]
  local root_dir = vim.fs.dirname(root_path)

  vim.lsp.start({
    name = 'typescript-language-server',
    cmd = { 'typescript-language-server', '--stdio', '--log-level', '4' },
    root_dir = root_dir
  })

  local buffer = vim.api.nvim_get_current_buf()
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
end

return Module
