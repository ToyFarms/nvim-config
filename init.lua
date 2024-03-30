require("setting")
require("keybind")
require("command")

require("init_plugins").init()
require("custom_plugin.quickcmd.quickcmd").init()

vim.cmd([[colorscheme tokyonight-night]])
