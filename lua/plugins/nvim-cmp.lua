return {
        {
                "hrsh7th/nvim-cmp",
                dependencies = {
                        "hrsh7th/cmp-buffer",
                        "hrsh7th/cmp-path",
                        "hrsh7th/cmp-nvim-lsp",
                        "hrsh7th/cmp-nvim-lsp-signature-help",
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
                                window = {},
                                mapping = cmp.mapping.preset.insert({
                                        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                                        ["<C-f>"] = cmp.mapping.scroll_docs(4),
                                        ["<C-j><C-n>"] = cmp.mapping(function(fallback)
                                                if luasnip.jumpable(1) then
                                                        luasnip.jump(1)
                                                else
                                                        fallback()
                                                end
                                        end, { "i", "s" }),
                                        ["<C-j><C-p>"] = cmp.mapping(function(fallback)
                                                if luasnip.jumpable(-1) then
                                                        luasnip.jump(-1)
                                                else
                                                        fallback()
                                                end
                                        end, { "i", "s" }),
                                        ["<CR>"] = cmp.mapping.confirm({ select = true }),
                                        ["<C-e>"] = cmp.mapping.abort(),
                                }),
                                sources = cmp.config.sources({
                                        { name = "nvim_lsp" },
                                        { name = "nvim_lsp_signature_help" },
                                        { name = "luasnip" },
                                        { name = "buffer" },
                                        { name = "path" },
                                }),
                        })
                end,
        },
}
