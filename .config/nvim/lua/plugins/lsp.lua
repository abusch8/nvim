return {
    {
        "williamboman/mason.nvim",
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls", "bashls", "pyright" },
        },
        lazy = false,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            for _, server in ipairs(require("mason-lspconfig").get_installed_servers()) do
                vim.lsp.config(server, {})
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
    },
}
