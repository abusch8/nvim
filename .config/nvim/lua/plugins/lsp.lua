return {
    {
        "williamboman/mason.nvim",
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls", "bashls", "pyright", "lemminx" },
        },
        lazy = false,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local configs = {
                bashls = {
                    cmd = { "bash-language-server", "start" },
                    filetypes = { "bash", "sh" },
                },
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                        },
                    },
                },
            }
            for _, server in ipairs(require("mason-lspconfig").get_installed_servers()) do
                vim.lsp.config(server, configs[server] or {})
            end
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            highlight = {
                enable = true,
            },
        },
        run = ":TSUpdate",
    },
}
