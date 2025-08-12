return {
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
