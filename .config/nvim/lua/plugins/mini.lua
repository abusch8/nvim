return {
    {
        "echasnovski/mini.comment",
        opts = {},
    },
    {
        "echasnovski/mini.pairs",
        opts = {},
    },
    {
        "nvim-mini/mini.surround",
        opts = {},
    },
    {
        "nvim-mini/mini.splitjoin",
        config = function ()
            local splitjoin = require("mini.splitjoin")

            local add_trailing = splitjoin.gen_hook.add_trailing_separator()
            local del_trailing = splitjoin.gen_hook.del_trailing_separator()

            splitjoin.setup({
                split = {
                    hooks_post = {
                        add_trailing,
                    },
                },
                join = {
                    hooks_post = {
                        del_trailing,
                    },
                },
            })
        end
    },
}
