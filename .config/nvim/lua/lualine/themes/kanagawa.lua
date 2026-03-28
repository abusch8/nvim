local theme = require("kanagawa.colors").setup().theme

local kanagawa = {}

kanagawa.normal = {
    a = { bg = "none", fg = theme.syn.fun, gui = "bold" },
    b = { bg = "none", fg = theme.syn.statement, gui = "bold" },
    c = { bg = "none", fg = theme.ui.fg },
}

kanagawa.insert = {
    a = { bg = "none", fg = theme.diag.ok, gui = "bold" },
}

kanagawa.command = {
    a = { bg = "none", fg = theme.syn.operator, gui = "bold" },
}

kanagawa.visual = {
    a = { bg = "none", fg = theme.syn.keyword, gui = "bold" },
}

kanagawa.replace = {
    a = { bg = "none", fg = theme.syn.constant, gui = "bold" },
}

kanagawa.inactive = {
    a = { bg = "none", fg = theme.ui.nontext },
    b = { bg = "none", fg = theme.ui.nontext },
    c = { bg = "none", fg = theme.ui.nontext },
}

if vim.g.kanagawa_lualine_bold then
    for _, mode in pairs(kanagawa) do
        mode.a.gui = "bold"
    end
end

return kanagawa
