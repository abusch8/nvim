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
                lualine_a = {
                    {
                        "mode",
                    },
                },
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
                        "lsp_status",
                        icon = '',
                        symbols = {
                            spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
                            done = '',
                            separator = '',
                        },
                        ignore_lsp = {},
                        show_name = false,
                    },
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
                        "searchcount",
                    },
                    {
                        "progress",
                        "selectioncount"
                    }
                },
                lualine_z = {
                    "location",
                },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    {
                        "filename",
                        path = 1,
                    }
                },
                lualine_x = {},
                lualine_y = {},
                lualine_z = {
                    {
                        "location",
                    },
                },
            },
        },
    },
}
