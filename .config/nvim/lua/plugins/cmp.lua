return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
        config = function()
            local cmp = require("cmp")
            local icons = require("icons")

            local symbol_map =  {
                Text = icons.get("typography"),
                Method = icons.get("package"),
                Function = icons.get("package"),
                Constructor = icons.get("class"),
                Field = icons.get("field"),
                Variable = icons.get("variable"),
                Class = icons.get("class"),
                Interface = icons.get("interface"),
                Module = icons.get("container"),
                Property = icons.get("tag"),
                Unit = icons.get("constant"),
                Value = icons.get("number"),
                Enum = icons.get("hash"),
                Keyword = icons.get("keyword"),
                Snippet = icons.get("snippet"),
                Color = icons.get("paintbrush"),
                File = icons.get("file"),
                Reference = icons.get("mention"),
                Folder = icons.get("file-directory"),
                EnumMember = icons.get("constant"),
                Constant = icons.get("constant"),
                Struct = icons.get("struct"),
                Event = icons.get("zap"),
                Operator = icons.get("plus-circle"),
                TypeParameter = icons.get("type"),
            }

            cmp.setup({
                formatting = {
                    format = function(_, item)
                        item.kind = symbol_map[item.kind] .. "  " .. item.kind
                        return item
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                    { name = "luasnip" },
                }),
            })
        end,
    }
}
