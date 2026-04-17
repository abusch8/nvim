vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.py",
    callback = function()
        vim.cmd("silent noautocmd !ruff check % --select I --fix")
        vim.cmd("edit!")
    end
})

