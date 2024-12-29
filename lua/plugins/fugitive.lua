return {
        "tpope/vim-fugitive",
        config = function()
                vim.keymap.set("n", "<leader>gb", ":Git blame<CR>")
                vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<CR>")
        end,
}
