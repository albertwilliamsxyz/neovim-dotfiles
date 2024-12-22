-- Options

vim.opt.title = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.showtabline = 2
vim.opt.expandtab = true

-- Appearance

vim.opt.termguicolors = true

-- Timeouts

vim.opt.timeout = true
vim.opt.timeoutlen = 10000

vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 0

-- Functions

local function reload_configuration()
        vim.cmd(vim.fn.expand("source $MYVIMRC"))
        print(vim.fn.expand("$MYVIMRC sourced successfully"))
end

-- Mappings

vim.g.mapleader = " "

-- Basics

vim.keymap.set("n", "<leader>e", ":Explore<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q<space>", ":quit<CR>")
vim.keymap.set("n", "<leader>qw", ":wq<CR>")
vim.keymap.set("n", "<leader>qa", ":qa<CR>")
vim.keymap.set("n", "<leader>qf", ":qa!<CR>")

-- Reloads

vim.keymap.set("n", "<leader>rc", reload_configuration)
vim.keymap.set("n", "<leader>rf", ":e!<CR>")

-- Show and hide

vim.keymap.set("n", "<leader>hh", ":nohl<CR>", { silent = true })

-- Tabs

vim.keymap.set("n", "<leader>tae", ":Texplore<CR>")
vim.keymap.set("n", "<leader>tao", ":tabo<CR>")
vim.keymap.set("n", "<leader>tah", ":tabe %<CR>")

-- Language Server Protocol

vim.lsp.set_log_level("trace")

require("config.lazy")
