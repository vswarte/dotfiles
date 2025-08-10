local visuals = {
    -- General
    FONT = "ProggyClean Nerd Font Mono:h12",

    COLORSCHEME = "kanagawa",
    LUALINE_THEME = "auto",
    WINDOW_BORDER = { '▔', '▕', '▁', '▏', '🭽', '🭾', '🭿', '🭼' },

    -- Icons
    ICON_ERROR = "󰅚",
    ICON_WARN =  "󰀪",
    ICON_INFO =  "󰋽",
    ICON_HINT =  "󰌶",

    ICON_FILES = "󰈔",
    ICON_PROJECTS = "",
    ICON_HISTORY = "",
    ICON_CONFIGURATION = "",

    ICON_SEARCH = "",
    ICON_CARET  = "",

    -- Formatters
    FORMATTER_TELESCOPE_ICON = function(i)
        return " " .. i .. " "
    end,

    FORMATTER_DASHBOARD_ICON = function(i)
        return i .. " "
    end,

    FORMATTER_LUALINE_DIAGNOSTICS_ICON = function(i)
        return i .. " "
    end,
}

return {
    config = function()
        vim.opt.wrap = true
        vim.opt.breakindent = true
        vim.opt.number = true
        vim.opt.relativenumber = true
        vim.opt.termguicolors = true
        vim.opt.cursorline = true
        vim.opt.colorcolumn = "80"
        vim.opt.hlsearch = false

        if vim.g.neovide then
            vim.o.guifont = visuals.FONT
            vim.g.neovide_confirm_quit = true

            vim.g.neovide_cursor_trail_size = 0.8
            vim.g.neovide_cursor_vfx_mode = "torpedo"
            vim.g.neovide_floating_shadow = true
            vim.g.neovide_floating_z_height = 10
            vim.g.neovide_light_angle_degrees = 45
            vim.g.neovide_light_radius = 5
        end
    end,
    dependencies = function()
        return {
            "rebelot/kanagawa.nvim",
            {
                "romgrk/barbar.nvim",
                dependencies = { "nvim-tree/nvim-web-devicons" },
                init = function()
                    vim.g.barbar_auto_setup = false
                end,
                opts = {
                    sidebar_filetypes = {
                        NvimTree = { text = "<U+F15C> File Tree" },
                        undotree = { text = "<U+F464> Revision History" },
                        Outline = { text = "<U+F1B2> Structure Outline" },
                    },
                },
            },
        }
    end,
    after = function()
        vim.cmd("colorscheme " .. visuals.COLORSCHEME)
    end,
}
