vim.keymap.set("n", "<leader>rn", ":Rename ")

return {
    {
        "smjonas/inc-rename.nvim",
        opts = {
            cmd_name = "Rename",
        },
    },
}
