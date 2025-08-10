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
    end,
}
