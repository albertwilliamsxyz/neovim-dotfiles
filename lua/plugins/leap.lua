return {
        'ggandor/leap.nvim',
        dependencies = {
                'tpope/vim-repeat'
        },
        opts = {
                case_sensitive = false
        },
        keys = {
                { '<leader>s',  '<Plug>(leap-forward)',     mode = { 'n', 'x', 'o' } },
                { '<leader>S',  '<Plug>(leap-backward)',    mode = { 'n', 'x', 'o' } },
                { '<leader>gs', '<Plug>(leap-from-window)', mode = { 'n', 'x', 'o' } }
        }
}
