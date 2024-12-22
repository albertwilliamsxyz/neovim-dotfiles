return {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        lazy = false,
        opts = {
                ensure_installed = {
                        "lua_ls",
                        "stylua",
                        "emmet-language-server",
                        "misspell",
                        "codespell",
                },
                run_on_start = true,
        },
}
