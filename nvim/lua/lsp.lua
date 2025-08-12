return {
    config = function()
    end,
    dependencies = function()
        return {
            {
                'mrcjkb/rustaceanvim',
                version = '^6',
                lazy = false,
            },
            {
                "williamboman/mason.nvim",
                config = function()
                    require("mason").setup()
                end
            },
            {
                "williamboman/mason-lspconfig.nvim",
                config = function()
                    require("mason-lspconfig").setup({
                        ensure_installed = {
                            "lua_ls",
                            "eslint",
                            "ts_ls",
                        }
                    })
                end
            },
            {
                "neovim/nvim-lspconfig",
                config = function()
                    local lspconfig = require('lspconfig')
                    lspconfig.lua_ls.setup ({})
                    lspconfig.eslint.setup ({})
                    lspconfig.ts_ls.setup ({})
                end
            },
        }
    end,
    after = function()
    end,
}
