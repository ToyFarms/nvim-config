require("setting")
require("init_plugins").init()
vim.cmd([[colorscheme onedark]])
vim.cmd([[colorscheme onedark]]) -- idk why, required to fix bufferline color

require("custom_plugin.quickcmd.quickcmd").init()

require("keybind")
require("command")
