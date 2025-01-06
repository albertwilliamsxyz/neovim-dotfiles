return {
        {
                "hrsh7th/nvim-cmp",
                dependencies = {
                        "hrsh7th/cmp-cmdline",
                        "hrsh7th/cmp-buffer",
                        "amarakon/nvim-cmp-buffer-lines",
                        "hrsh7th/cmp-path",
                        "hrsh7th/cmp-nvim-lsp",
                        "hrsh7th/cmp-nvim-lsp-signature-help",
                        "hrsh7th/cmp-nvim-lua",
                        "uga-rosa/cmp-dictionary",
                        {
                                "L3MON4D3/LuaSnip",
                                build = "make install_jsregexp",
                                dependencies = {
                                        "saadparwaiz1/cmp_luasnip",
                                        "rafamadriz/friendly-snippets",
                                },
                        },
                },
                config = function()
                        require("luasnip.loaders.from_vscode").lazy_load()

                        local luasnip = require("luasnip")
                        local cmp = require("cmp")

                        cmp.setup({
                                snippet = {
                                        expand = function(args)
                                                luasnip.lsp_expand(args.body)
                                        end,
                                },
                                window = {
                                        documentation = cmp.config.window.bordered(),
                                        completion = cmp.config.window.bordered(),
                                },
                                mapping = cmp.mapping.preset.insert({
                                        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                                        ["<C-f>"] = cmp.mapping.scroll_docs(4),
                                        ["<Tab>"] = cmp.mapping(function(fallback)
                                                if luasnip.expand_or_jumpable() then
                                                        luasnip.expand_or_jump()
                                                else
                                                        fallback()
                                                end
                                        end, { "i", "s" }),
                                        ["<S-Tab>"] = cmp.mapping(function(fallback)
                                                if luasnip.jumpable(-1) then
                                                        luasnip.jump(-1)
                                                else
                                                        fallback()
                                                end
                                        end, { "i", "s" }),
                                        ["<C-e>"] = cmp.mapping.abort(),
                                        ["<CR>"] = cmp.mapping.confirm({
                                                behavior = cmp.ConfirmBehavior.Replace,
                                                select = true,
                                        }),
                                }),
                                sources = cmp.config.sources({
                                        { name = "path" },
                                        { name = "nvim_lsp_signature_help", priority = 5 },
                                        { name = "luasnip",                 keyword_length = 1, priority = 4 },
                                        { name = "nvim_lsp",                keyword_length = 2, priority = 6 },
                                        { name = "buffer",                  keyword_length = 2, priority = 2 },
                                        { name = "buffer-lines",            keyword_length = 2, priority = 1 },
                                        { name = "dictionary",              keyword_length = 3 },
                                        { name = "nvim_lua" },
                                }),
                        })

                        cmp.setup.cmdline({ "/", "?" }, {
                                mapping = cmp.mapping.preset.cmdline(),
                                sources = {
                                        { name = "buffer" },
                                },
                        })

                        cmp.setup.cmdline(":", {
                                mapping = cmp.mapping.preset.cmdline(),
                                sources = cmp.config.sources({
                                        { name = "path" },
                                        { name = "cmdline" },
                                }),
                                matching = { disallow_symbol_nonprefix_matching = false },
                        })

                        require("cmp_dictionary").setup({
                                paths = { "/usr/share/dict/words" },
                                exact_length = 3,
                        })
                end,
        },
}
