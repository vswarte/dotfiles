return {
    config = function()

    end,
    dependencies = function()
        return {
            {
                'nvim-tree/nvim-tree.lua',
                opts = {},
                dependencies = { 'nvim-tree/nvim-web-devicons' },
            },
            {
                "hedyhli/outline.nvim",
                opts = {
                    outline_window = {
                        width = 15,
                    },
                },
            },
        }
    end,
    after = function()
        vim.keymap.set('n', '<Leader>f', "<cmd>NvimTreeToggle<CR>", {})
        vim.keymap.set('n', '<Leader>o', "<cmd>Outline<CR>", {})
    end,
}
