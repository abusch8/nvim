return {
    {
        "folke/tokyonight.nvim",
        enabled = vim.tbl_contains({
            "tokyonight-night",
            "tokyonight-storm",
            "tokyonight-day",
            "tokyonight-moon",
        }, _G.THEME),
        opts = {
            transparent = true,
        },
    }
}
