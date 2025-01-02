return {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        lazy = false,
        opts = {
                ensure_installed = {
                        "lua_ls",
                        "stylua",
                        "emmet-language-server",
                        "codespell",
                        "ts_ls",
                        "pyright",
                        "jsonls",
                        "eslint_d",
                },
                run_on_start = true,
        },
}
