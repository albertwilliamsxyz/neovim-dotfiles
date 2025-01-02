return {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        lazy = false,
        opts = {
                ensure_installed = {
                        "lua_ls",
                        "stylua",
                        "ts_ls",
                        "pyright",
                        "jsonls",
                        "eslint_d",
                        "emmet-language-server",
                        "misspell",
                        "codespell",
                },
                run_on_start = true,
        },
}
