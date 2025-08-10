return {
    config = function()
        vim.opt.undodir = vim.fn.expand('~/.undo')
        vim.opt.undofile = true
    end,
    dependencies = function()
        return {
            "mbbill/undotree",
            {
                'nvim-telescope/telescope.nvim', tag = '0.1.8',
                dependencies = { 'nvim-lua/plenary.nvim' }
            }
        }
    end,
    after = function()
        vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

        vim.cmd("let g:sneak#label = 1")
        vim.keymap.set('n', '<Leader>f', "<cmd>NvimTreeToggle<cr>", {})
        vim.keymap.set('n', "<leader>o", "<cmd>Outline<CR>", {})

        local builtin = require("telescope.builtin")
        local themes = require('telescope.themes');
        vim.keymap.set('n', '<C-p>', builtin.find_files, {})
        vim.keymap.set('n', '<C-b>', builtin.buffers, {})
        vim.keymap.set('n', '<C-h>', builtin.help_tags, {})
        vim.keymap.set('n', '<C-c>', builtin.git_commits, {})
        vim.keymap.set('n', '<C-o>', builtin.lsp_document_symbols, {})
        vim.keymap.set('n', '<C-d>', function()
            builtin.diagnostics(themes.get_ivy({}))
        end, {})
        vim.keymap.set('n', '<C-g>', builtin.live_grep, {})
        vim.keymap.set('n', '<C-u>', builtin.lsp_references, {})
    end,
}
