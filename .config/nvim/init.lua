local env = require("env")
env.load_dotenv()

DEFAULT_THEME = "kanagawa"
DEFAULT_ENABLE_ICONS = false

_G.THEME = env.get("THEME") or DEFAULT_THEME
_G.ENABLE_ICONS = env.get("ENABLE_ICONS") == "1" or DEFAULT_ENABLE_ICONS

vim.cmd("source ~/.vimrc")

require("config.lazy")
require("config.options")
require("config.keymaps")
