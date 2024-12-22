return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			lazy = false,
			build = "make",
		},
		{
			"nvim-telescope/telescope-ui-select.nvim",
			lazy = false,
			config = function()
				local telescope = require("telescope")
				telescope.setup({
					extensions = {
						["ui-select"] = {
							require("telescope.themes").get_dropdown({}),
						},
					},
				})
				telescope.load_extension("ui-select")
			end,
		},
	},
	keys = {
		{ "<leader>fa", ":Telescope<CR>" },
		{ "<leader>ff", ":Telescope find_files<CR>" },
		{ "<leader>fg", ":Telescope live_grep<CR>" },
		{ "<leader>fh", ":Telescope current_buffer_fuzzy_find<CR>" },
		{ "<leader>fk", ":Telescope keymaps<CR>" },
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				file_ignore_patterns = { "node_modules", ".git", ".env" },
				winblend = 100,
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		})
		telescope.load_extension("fzf")
	end,
}
