return {
    config = function()
        vim.g.clipboard = {
            name = 'xsel',
            copy = {
                ['+'] = 'xsel -ib',
                ['*'] = 'xsel -ib',
            },
            paste = {
                ['+'] = 'xsel -ob',
                ['*'] = 'xsel -ob',
            },
        }

        -- Tabbing behavior
        vim.opt.tabstop = 4
        vim.opt.shiftwidth = 4
        vim.opt.smarttab = true
        vim.opt.expandtab = true

        -- Search
        vim.opt.ignorecase = true
        vim.opt.smartcase = true

        -- Basic keybinds
        vim.g.mapleader = "\\"
    end,
    dependencies = function()
        return {}
    end,
    after = function()
    end,
}
