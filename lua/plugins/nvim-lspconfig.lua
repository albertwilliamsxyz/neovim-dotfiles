return {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local lspconfig = require("lspconfig")

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					runtime = { version = "Lua 5.4", path = package.path },
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
						},
					},
					telemetry = { enable = false },
				},
			},
		})

		lspconfig.emmet_language_server.setup({
			filetypes = {
				"html",
				"css",
				"javascript",
				"javascriptreact",
				"typescriptreact",
				"less",
				"sass",
				"scss",
				"pug",
			},
			init_options = {
				includeLanguages = {},
				excludeLanguages = {},
				extensionsPath = {},
				preferences = {},
				showAbbreviationSuggestions = true,
				showExpandedAbbreviation = "always",
				showSuggestionsAsSnippets = true,
				syntaxProfiles = {},
				variables = {},
			},
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(event)
				local buffer = event.buf
				local options = { noremap = true, silent = false, buffer = buffer }

				-- Jumping
				vim.keymap.set("n", "<leader>lgd", vim.lsp.buf.definition, options)
				vim.keymap.set("n", "<leader>lgD", vim.lsp.buf.declaration, options)
				vim.keymap.set("n", "<leader>lgi", vim.lsp.buf.implementation, options)
				vim.keymap.set("n", "<leader>lgr", vim.lsp.buf.references, options)

				-- Actions
				vim.keymap.set("n", "<leader>lft", vim.lsp.buf.format, options)
				vim.keymap.set("n", "<leader>lrn", vim.lsp.buf.rename, options)
				vim.keymap.set("n", "<leader>lca", vim.lsp.buf.code_action, options)

				-- Diagnostics and Information
				vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, options)
				vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, options)

				-- Insert mode
				vim.keymap.set("i", "<C-S>", vim.lsp.buf.signature_help, options)

				-- Functions

				local function format_buffer()
					vim.lsp.buf.format({ async = false })
				end

				-- Autocommands / Autogroups

				vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePre" }, {
					buffer = buffer,
					callback = format_buffer,
				})
			end,
		})
	end,
}
