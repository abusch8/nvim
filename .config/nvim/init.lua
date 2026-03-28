vim.cmd("source ~/.vimrc")

local DEFAULT_THEME = "kanagawa"
_G.THEME = os.getenv("NVIM_THEME") or DEFAULT_THEME

require("config.lazy")
require("config.options")
require("config.keymaps")
