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
            "justinmk/vim-sneak",
            {
                'nvim-telescope/telescope.nvim', tag = '0.1.8',
                dependencies = {
                    "nvim-lua/plenary.nvim",
                    "nvim-telescope/telescope-project.nvim",
                }
            },
        }
    end,
    after = function()
        vim.keymap.set('n', '<Leader>f', "<cmd>NvimTreeToggle<CR>", {})
        vim.keymap.set('n', '<Leader>o', "<cmd>Outline<CR>", {})

        vim.cmd("let g:sneak#label = 1")
        local builtin = require("telescope.builtin")
        local themes = require('telescope.themes');
        vim.keymap.set('n', '<C-p>', builtin.find_files, {})
        vim.keymap.set('n', '<C-b>', builtin.buffers, {})
        vim.keymap.set('n', '<C-h>', builtin.help_tags, {})
        vim.keymap.set('n', '<C-c>', builtin.git_commits, {})
        vim.keymap.set('n', '<C-o>', builtin.lsp_document_symbols, {})
        vim.keymap.set('n', '<C-g>', builtin.live_grep, {})
        vim.keymap.set('n', '<C-u>', builtin.lsp_references, {})
    end,
}
