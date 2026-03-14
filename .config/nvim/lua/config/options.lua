vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 0
vim.opt.termguicolors = true

vim.cmd.colorscheme("nightfox")

local function sync_cmdline_with_statusline_theme()
    local statusline = vim.api.nvim_get_hl_by_name("StatusLine", true)
    local bg = statusline.background
    local fg = statusline.foregound
    vim.api.nvim_set_hl(0, "MsgArea", { bg = bg, fg = fg })
    vim.api.nvim_set_hl(0, "Cmdline", { bg = bg, fg = fg })
end

sync_cmdline_with_statusline_theme()

vim.api.nvim_create_autocmd("ColorScheme", { callback = sync_cmdline_with_statusline_theme })

