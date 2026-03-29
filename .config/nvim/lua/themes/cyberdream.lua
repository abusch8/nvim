return {
    {
        "scottmckendry/cyberdream.nvim",
        enabled = vim.tbl_contains({
            "cyberdream",
        }, _G.THEME),
        lazy = false,
        priority = 1000,
        opts = {
            transparent = true,
        },
    },
}
