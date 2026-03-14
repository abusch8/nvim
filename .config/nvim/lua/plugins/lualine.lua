local function search_count()
    local search = vim.fn.getreg("/")
    if search == "" then
        return ""
    end

    local count = vim.fn.searchcount({ maxcount = 0, recompute = 1 })
    if count.total > 0 then
        return string.format("%d/%d", count.current, count.total)
    else
        return ""
    end
end

local function show_macro_recording()
    local recording_register = vim.fn.reg_recording()
    if recording_register == "" then
        return ""
    else
        return "Recording @" .. recording_register
    end
end

vim.api.nvim_create_autocmd("RecordingEnter", {
    callback = function()
        require("lualine").refresh({ place = { "statusline" } })
    end,
})

vim.api.nvim_create_autocmd("RecordingLeave", {
    callback = function()
        local timer = vim.loop.new_timer()
        timer:start(50, 0, vim.schedule_wrap(function()
            require("lualine").refresh({ place = { "statusline" } })
        end))
    end,
})

return {
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            options = {
                component_separators = "",
                section_separators = "",
                refresh = {
                    statusline = 500,
                    tabline = 500,
                    winbar = 500,
                },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = {
                    {
                        "branch",
                    },
                    {
                        "diff",
                    },
                    {
                        "diagnostics",
                        symbols = {
                            error = "E",
                            warn = "W",
                            info = "I",
                            hint = "H",
                        },
                    },
                    {
                        "recording",
                        fmt = show_macro_recording,
                    },
                },
                lualine_c = {
                    {
                        "filename",
                        path = 1,
                    },
                },
                lualine_x = {
                    {
                        "encoding",
                    },
                    {
                        "fileformat",
                        symbols = {
                            unix = "LF",
                            dos = "CRLF",
                            mac = "CR",
                        },
                    },
                    {
                        "filetype",
                    },
                },
                lualine_y = {
                    {
                        "search",
                        fmt = search_count,
                    },
                    {
                        "progress",
                        "selectioncount"
                    }
                },
                lualine_z = { "location" },
            },
        },
    },
}
