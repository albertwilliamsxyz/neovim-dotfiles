return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-treesitter/nvim-treesitter-context",
	},
	config = function()
		require("nvim-treesitter.install").prefer_git = true

		require("nvim-treesitter.configs").setup({
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
					init_selection = "<leader>tis",
					node_incremental = "<leader>tni",
					scope_incremental = "<leader>tsi",
					node_decremental = "<leader>tnd",
				},
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
						["ab"] = "@block.outer",
						["ib"] = "@block.inner",
						["ap"] = "@parameter.outer",
						["ip"] = "@parameter.inner",
						["ia"] = "@assignment.inner",
						["aa"] = "@assignment.outer",
						["ir"] = "@return.inner",
						["ar"] = "@return.outer",
						["as"] = "@statement.outer",
						["lhsa"] = "@assignment.lhs",
						["rhsa"] = "@assignment.rhs",
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>mp"] = "@parameter.inner",
					},
					swap_previous = {
						["<leader>mP"] = "@parameter.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]s"] = "@statement.outer",
						["]r"] = "@return.outer",
						["]p"] = "@parameter.outer",
						["]b"] = "@block.outer",
						["]f"] = "@function.outer",
						["]c"] = "@class.outer",
					},
					goto_next_end = {
						["]S"] = "@statement.outer",
						["]R"] = "@return.outer",
						["]P"] = "@parameter.outer",
						["]B"] = "@block.outer",
						["]F"] = "@function.outer",
						["]C"] = "@class.outer",
					},
					goto_previous_start = {
						["[s"] = "@statement.outer",
						["[r"] = "@return.outer",
						["[p"] = "@parameter.outer",
						["[b"] = "@block.outer",
						["[f"] = "@function.outer",
						["[c"] = "@class.outer",
					},
					goto_previous_end = {
						["[S"] = "@statement.outer",
						["[R"] = "@return.outer",
						["[P"] = "@parameter.outer",
						["[B"] = "@block.outer",
						["[F"] = "@function.outer",
						["[C"] = "@class.outer",
					},
				},
			},
		})

		local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
		vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
		vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
		vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
		vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
		vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
		vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
	end,
}
