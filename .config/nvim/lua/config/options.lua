vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 0
vim.opt.termguicolors = true

vim.diagnostic.config({
    virtual_text = {
        enable = true,
        prefix = "●",
        severity = {
            vim.diagnostic.severity.ERROR,
            vim.diagnostic.severity.WARN,
        },
    },
})

vim.cmd.colorscheme("kanagawa")

