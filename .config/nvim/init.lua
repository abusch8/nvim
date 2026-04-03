vim.cmd("source ~/.vimrc")

local DEFAULT_THEME = "kanagawa"
local DEFAULT_ENABLE_ICONS = false

_G.THEME = os.getenv("NVIM_THEME") or DEFAULT_THEME
_G.ENABLE_ICONS = os.getenv("NVIM_ENABLE_ICONS") == "1" or DEFAULT_ENABLE_ICONS

require("config.lazy")
require("config.options")
require("config.keymaps")
