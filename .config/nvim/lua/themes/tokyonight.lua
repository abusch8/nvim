return {
    {
        "folke/tokyonight.nvim",
        enabled = (_G.THEME and string.find(_G.THEME, "tokyonight")) ~= nil,
        opts = {
            transparent = true,
        },
    }
}
