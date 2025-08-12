local visuals = require('visuals');

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
            vim.g.neovide_scale_factor = 0.8
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
                        NvimTree = { text = "File Tree" },
                        undotree = { text = "Revision History" },
                        Outline = { text = "Structure Outline" },
                    },
                },
            },
            {
                "nvimdev/dashboard-nvim",
                opts = {
                    theme = "doom",
                    config = {
                        header = visuals.DASHBOARD_HEADER,
                        shortcut = {},
                        center = {
                            {
                                icon = visuals.FORMATTER_DASHBOARD_ICON(
                                    visuals.ICON_FILES
                                ),
                                desc = "Files",
                                action = "Telescope find_files",
                                key = 'f',
                            },
                            {
                                icon = visuals.FORMATTER_DASHBOARD_ICON(
                                    visuals.ICON_PROJECTS
                                ),
                                desc = "Projects",
                                action = "Telescope project",
                                key = 'p',
                            },
                            {
                                icon = visuals.FORMATTER_DASHBOARD_ICON(
                                    visuals.ICON_HISTORY
                                ),
                                desc = "History",
                                action = "Telescope oldfiles",
                                key = 'h',
                            },
                            {
                                icon = visuals.FORMATTER_DASHBOARD_ICON(
                                    visuals.ICON_CONFIGURATION
                                ),
                                desc = "Configuration",
                                action = "cd ~/.config/nvim | edit $MYVIMRC",
                                key = 'c',
                            },
                        },
                        footer = visuals.DASHBOARD_FOOTER,
                    },
                },
                dependencies = { "nvim-tree/nvim-web-devicons" }
            },
			{
				"folke/noice.nvim",
				event = "VeryLazy",
				opts = {
					views = {
						cmdline_popup = {
							border = {
								style = "none",
								padding = { 1, 1 },
							},
							win_options = {
								winhighlight = "",
							},
						},
						-- notify = { border = { style = "none" } },
						-- popupmenu = { border = { style = "none" } },
					},
					lsp = {
						override = {
							["vim.lsp.util.convert_input_to_markdown_lines"] = true,
							["vim.lsp.util.stylize_markdown"] = true,
							["cmp.entry.get_documentation"] = true,
						},
					},
				},
				dependencies = {
					"MunifTanjim/nui.nvim",
					"rcarriga/nvim-notify",
				},
			},

            "lewis6991/gitsigns.nvim",
            {
                "lukas-reineke/indent-blankline.nvim",
                main = "ibl",
                opts = {
                    exclude = {
                        filetypes = {
                            "help",
                            "man",
                            "checkhealth",
                            "dashboard",
                            "TelescopePrompt",
                            "TelescopeResults",
                        }
                    },
                    indent = { char = "┇" },
                },
            },
            {
                "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
                opts = true,
            },
        }
    end,
    after = function()
        vim.cmd("colorscheme " .. visuals.COLORSCHEME)

        vim.keymap.set(
            "",
            "<Leader>l",
            require("lsp_lines").toggle,
            { desc = "Toggle lsp_lines" }
        )
    end,
}
