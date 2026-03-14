vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float(nil, { scope = "line" }) end)
