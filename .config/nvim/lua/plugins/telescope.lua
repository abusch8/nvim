return {
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
        },
        config = function ()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")
            local icons = require("icons")

            local function find_files()
                builtin.find_files({
                    previewer = false,
                    layout_config = {
                        width = 0.5,
                        height = 0.5,
                    },
                    file_ignore_patterns = {
                        ".git",
                        ".npm",
                        ".venv",
                        "build",
                        "dist",
                        "node_modules",
                        "target",
                    },
                })
            end

            vim.keymap.set("n", "<C-p>", find_files)

            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set("n", "<leader>fz", builtin.live_grep, { desc = 'Telescope live grep' })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = 'Telescope buffers' })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = 'Telescope help tags' })

            local icon = icons.get("telescope")

            telescope.setup({
                defaults = {
                    prompt_prefix = icon == "" and " " or " " .. icon .. " ",
                    selection_caret = " > ",
                    entry_prefix = "   ",
                },
                pickers = {
                    find_files = {
                        hidden = true,
                    },
                },
            })
        end
    },
}
