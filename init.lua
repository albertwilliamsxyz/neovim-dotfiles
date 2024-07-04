--[[

Author: Albert J. Williams
Github user: albertwilliamsxyz

To Do:
- Include emmet
- Ease migration of configuration between machines
- Automate plugin management:
	LuaSnip
	base16-nvim
	leap.nvim
	nvim-treesitter
	nvim-treesitter-textobjects
	nvim-web-devicons
	plenary.nvim
	telescope-fzf-native.nvim
	telescope.nvim
	vim-airline
	vim-airline-themes
	vim-fugitive
	vim-repeat

--]]

-- Telescope

require('telescope').setup({
	defaults = {
		file_ignore_patterns = { 'node_modules', '.git', '.env' }
	}
})
require('telescope').load_extension('fzf')

-- Leap

local leap = require('leap')
leap.setup({ case_sensitive = false })

-- Packages

local lua_folder = vim.fn.expand('$HOME/.config/nvim/lua')
local lua_scripts_pattern = lua_folder .. '/?.lua'
local lua_modules_pattern = lua_folder .. '/?/init.lua'
local lua_patterns = lua_modules_pattern .. ';' .. lua_scripts_pattern
package.path = package.path .. ';' .. lua_patterns

-- Dev Envs

vim.g.python3_host_prog = '/usr/bin/python3'

-- Options

vim.opt.title = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.showtabline = 2

-- Appearance

vim.opt.termguicolors = true
vim.cmd('colorscheme base16-grayscale-light')

-- Timeouts

vim.opt.timeout = true
vim.opt.timeoutlen = 10000

vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 0

-- Functions

local function reload_configuration()
	vim.cmd(vim.fn.expand('source $MYVIMRC'))
	print(vim.fn.expand('$MYVIMRC sourced successfully'))
end

-- Mappings

vim.g.mapleader = ' '

--	Basics

vim.keymap.set('n', '<leader>e', ':Explore<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q<space>', ':quit<CR>')
vim.keymap.set('n', '<leader>qw', ':wq<CR>')
vim.keymap.set('n', '<leader>qa', ':qa<CR>')
vim.keymap.set('n', '<leader>qf', ':qa!<CR>')

--	Reloads

vim.keymap.set('n', '<leader>rc', reload_configuration)
vim.keymap.set('n', '<leader>rf', ':e!<CR>')

--	Show and hide

vim.keymap.set('n', '<leader>hh', ':nohl<CR>', { silent = true })

--	Tabs

vim.keymap.set('n', '<leader>tae', ':Texplore<CR>')
vim.keymap.set('n', '<leader>tao', ':tabo<CR>')
vim.keymap.set('n', '<leader>tah', ':tabe %<CR>')

-- Telescope

vim.keymap.set('n', '<leader>fa', ':Telescope<CR>')
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>fh', ':Telescope current_buffer_fuzzy_find<CR>')
vim.keymap.set('n', '<leader>fk', ':Telescope keymaps<CR>')

-- Leap

vim.keymap.set({ 'n', 'x', 'o' }, '<leader>s', '<Plug>(leap-forward)')
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>S', '<Plug>(leap-backward)')
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>gs', '<Plug>(leap-from-window)')

-- Fugitive

vim.keymap.set('n', '<leader>gb', ':Git blame<CR>')
vim.keymap.set('n', '<leader>gd', ':Gdiffsplit<CR>')

-- Language Server Protocol

vim.lsp.set_log_level('debug')

-- Tree-sitter

require('nvim-treesitter.install').prefer_git = true

---@diagnostic disable-next-line: missing-fields
require('nvim-treesitter.configs').setup({
	ensure_installed = { 'bash', 'c', 'javascript', 'typescript', 'tsx', 'lua', 'python' },
	sync_install = true,
	auto_install = true,
	indent = { enable = true },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = '<leader>tis',
			node_incremental = '<leader>tni',
			scope_incremental = '<leader>tsi',
			node_decremental = '<leader>tnd',
		}
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
				['ab'] = '@block.outer',
				['ib'] = '@block.inner',
				['ap'] = '@parameter.outer',
				['ip'] = '@parameter.inner',
				['ia'] = '@assignment.inner',
				['aa'] = '@assignment.outer',
				['ir'] = '@return.inner',
				['ar'] = '@return.outer',
				['as'] = '@statement.outer',
				['lhsa'] = '@assignment.lhs',
				['rhsa'] = '@assignment.rhs',
			},
		},
		swap = {
			enable = true,
			swap_next = {
				['<leader>mp'] = '@parameter.inner',
			},
			swap_previous = {
				['<leader>mP'] = '@parameter.inner',
			}
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				[']s'] = '@statement.outer',
				[']r'] = '@return.outer',
				[']p'] = '@parameter.outer',
				[']b'] = '@block.outer',
				[']f'] = '@function.outer',
				[']c'] = '@class.outer',
			},
			goto_next_end = {
				[']S'] = '@statement.outer',
				[']R'] = '@return.outer',
				[']P'] = '@parameter.outer',
				[']B'] = '@block.outer',
				[']F'] = '@function.outer',
				[']C'] = '@class.outer',
			},
			goto_previous_start = {
				['[s'] = '@statement.outer',
				['[r'] = '@return.outer',
				['[p'] = '@parameter.outer',
				['[b'] = '@block.outer',
				['[f'] = '@function.outer',
				['[c'] = '@class.outer',
			},
			goto_previous_end = {
				['[S'] = '@statement.outer',
				['[R'] = '@return.outer',
				['[P'] = '@parameter.outer',
				['[B'] = '@block.outer',
				['[F'] = '@function.outer',
				['[C'] = '@class.outer',
			},
		},
	},
})

-- Luasnip

vim.keymap.set({ 'i', 's' }, '<C-k>', "<cmd>lua require'luasnip'.expand_or_jump()<CR>", { noremap = true, silent = true })
vim.keymap.set({ 'i', 's' }, '<C-j>', "<cmd>lua require'luasnip'.jump(-1)<CR>", { noremap = true, silent = true })
vim.keymap.set({ 'i', 's' }, '<C-l>',
	"<cmd>lua require'luasnip'.choice_active() and require'luasnip'.change_choice(1)<CR>",
	{ noremap = true, silent = true })

local luasnip = require('luasnip')
local snippet = luasnip.snippet
local text_node = luasnip.text_node
local insert_node = luasnip.insert_node
local snippet_node = luasnip.snippet_node

luasnip.add_snippets('lua', {
	snippet('map', {
		text_node('vim.keymap.set('),
		insert_node(1, 'mode'),
		text_node(", '<leader>"),
		insert_node(2, 'key'),
		text_node("', '"),
		insert_node(3, 'value'),
		text_node("')"),
	}),
	snippet('opt', {
		text_node('vim.opt.'),
		insert_node(1, 'option'),
		text_node(' = '),
		insert_node(2, 'value')
	}),
	snippet('snp', {
		text_node("snippet('"),
		insert_node(1, 'snippet'),
		text_node({ "', {", '\t' }),
		insert_node(2, 'placeholder'),
		text_node({ '', '}),' })
	}),
	snippet('lvr', {
		text_node('local '),
		insert_node(1, 'name'),
		text_node(' = '),
		insert_node(2, 'value')
	}),
	snippet('lfn', {
		text_node('local function '),
		insert_node(1, 'name'),
		text_node({ '()', '\t' }),
		insert_node(2, 'placeholder'),
		text_node({ '', 'end' }),
	}),
})

luasnip.add_snippets('typescript', {
	snippet('desc', {
		text_node("describe('"),
		insert_node(1, 'placeholder'),
		text_node({ "', () => {", '\t' }),
		insert_node(2, 'placeholder'),
		text_node({ '', '})' }),
	}),
	snippet('test', {
		text_node("test('"),
		insert_node(1, 'placeholder'),
		text_node({ "', () => {", '\t' }),
		insert_node(2, 'placeholder'),
		text_node({ '', '})' }),
	}),
	snippet('testtd', {
		text_node("test.todo('"),
		insert_node(1, 'placeholder'),
		text_node("')"),
	}),
	snippet('etb', {
		text_node('expect('),
		insert_node(1, 'placeholder'),
		text_node(').toBe('),
		insert_node(2, 'placeholder'),
		text_node(')'),
	}),
	snippet('cls', {
		text_node('class '),
		insert_node(1, 'name'),
		text_node({ ' {', '\t' }),
		insert_node(2, 'placeholder'),
		text_node({ '', '}' })
	}),
})

luasnip.add_snippets('python', {
	snippet('functestdec', {
		text_node('@pytest.mark.functional(permissions=['),
		insert_node(1, 'permissions'),
		text_node('])')
	}),
	snippet('functest', {
		text_node('@pytest.mark.functional(permissions=['),
		insert_node(1, 'permissions'),
		text_node({ '])', 'def test_' }),
		insert_node(2, 'name'),
		text_node('('),
		insert_node(3, 'parameters'),
		text_node({ '):', '\t' }),
		insert_node(4, 'pass')
	}),
	snippet('test', {
		text_node('def test_'),
		insert_node(1, 'name'),
		text_node('('),
		insert_node(2, 'parameters'),
		text_node({ '):', '\t' }),
		insert_node(3, 'pass')
	}),
	snippet('def', {
		text_node('def '),
		insert_node(1, 'name'),
		text_node('('),
		insert_node(2, 'parameters'),
		text_node({ '):', '\t' }),
		insert_node(3, 'placeholder')
	})
})
