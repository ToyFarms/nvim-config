require("setting")
require("keybind")
require("command")

require("init_plugins").init()

-- vim.cmd("colorscheme onedark")
-- vim.cmd("colorscheme onedark")
vim.cmd("colorscheme kanagawa-wave")

require("custom_plugin.quickcmd.quickcmd").init()
require("custom_plugin.multiline-edit").init()
