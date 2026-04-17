vim.keymap.set("n", "<leader>e", function()
    vim.diagnostic.open_float(nil, { scope = "line" })
end)

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local buffer = args.buf
        local opts = { noremap = true, silent = true, buffer = buffer }

        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    end,
})

