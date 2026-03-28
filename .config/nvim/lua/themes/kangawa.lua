return {
    {
        "rebelot/kanagawa.nvim",
        enabled = (_G.THEME and string.find(_G.THEME, "kanagawa")) ~= nil,
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
