local visuals = require('visuals');

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
				'nvim-telescope/telescope.nvim', tag = '0.1.5',
				dependencies = {
					"folke/noice.nvim",
					"nvim-lua/plenary.nvim",
					"nvim-telescope/telescope-project.nvim",
					"nvim-telescope/telescope-ui-select.nvim",
				},
				config = function()
					local actions = require("telescope.actions")
					local project_actions = require("telescope._extensions.project.actions")

					require('telescope').setup({
						extensions = {
							project = {
								base_dirs = {},
								hidden_files = true,
								order_by = "asc",
								search_by = "title",
								sync_with_nvim_tree = false,
								on_project_selected = function(prompt_bufnr)
									project_actions.change_working_directory(prompt_bufnr, false)

									local telescope = require("telescope.builtin")
									telescope.find_files()
								end
							},
							["ui-select"] = {
								require("telescope.themes").get_dropdown({})
							}
						},
						defaults = {
							borderchars = { "", "", "", "", "", "", "", "" },
							sort_mru = true,
							multi_icon = '',
							entry_prefix = ' ',
							prompt_prefix = visuals.FORMATTER_TELESCOPE_ICON(
								visuals.ICON_SEARCH
							),
							selection_caret = visuals.FORMATTER_TELESCOPE_ICON(
								visuals.ICON_CARET
							),
							mappings = {
								i = {
									["<esc>"] = actions.close,
								},
							},
						},
					})

					local telescope = require("telescope");
					telescope.load_extension("noice");
					telescope.load_extension("ui-select");
				end
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
