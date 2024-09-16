# NeoVim config

Derived from [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)

## Adding plugins

This config uses [lazy.nvim](https://github.com/folke/lazy.nvim) as its plugin manager.<br>
If the plugins is simple and require no initialization or config, you can directly add them to `lua/init_plugins.lua`<br>
otherwise it is recommended to separate it into its own file to `lua/plugins/c_<plugin_name>.lua`<br>
The `c_` prefix is not required, but recommended to avoid name collision.

You can add the usual table you pass to lazy.init() like this:
```Lua
local M = {}

M.lazy = {
    -- This will be passed to lazy.init()
    "example/plugin",
    config = {},
}

-- Optional
-- function M.init()
--     Called after lazy.init()
-- end

return M
```

To add a custom plugin, you can add them to `lua/custom_plugin` though, you need to manually include them in `init.lua`

## Adding nvim config

`lua/keybind.lua` for keybind<br>
`lua/command.lua` for command<br>
`lua/setting.lua` for setting
