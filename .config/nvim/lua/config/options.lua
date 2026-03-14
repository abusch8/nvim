vim.opt.signcolumn = "yes"

-- remove background colors applied by colorschemes
local fg = vim.api.nvim_get_hl_by_name("Normal", true).foreground
vim.api.nvim_set_hl(0, "Normal", { fg = fg, bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { fg = fg, bg = "none" })
