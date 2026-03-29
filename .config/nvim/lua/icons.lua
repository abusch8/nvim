local M = {}

function M.get(name)
    if _G.ENABLE_ICONS then
        return require("nonicons.mapping").get(name)
    end
    return ""
end

return M
