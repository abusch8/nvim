return {
    {
        "rebelot/kanagawa.nvim",
        enabled = vim.tbl_contains({
            "kanagawa",
            "kanagawa-dragon",
            "kanagawa-lotus",
            "kanagawa-wave",
        }, _G.THEME),
        opts = {
            transparent = true,
            colors = {
                theme = {
                    all = {
                        ui = {
                            bg_gutter = "none",
                        },
                    },
                },
            },
        },
    },
}
