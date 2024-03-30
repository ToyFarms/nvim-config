local M = {}

local quickcmd_db = vim.fn.stdpath("config") .. "/lua/custom_plugin/quickcmd/quickcmd.txt"

M.run_cmd = function()
    local f = io.open(quickcmd_db, "r")
    if f == nil then
        vim.notify("No command set", vim.log.levels.WARN)
        return
    end

    require("toggleterm").exec(f:read(), 1)

    f:close()
end

M.get_cmd = function()
    local f = io.open(quickcmd_db, "r")
    if f == nil then return end

    vim.notify(f:read(), vim.log.levels.INFO)
    f:close()
end

M.add_cmd = function(cmd)
    local f = io.open(quickcmd_db, "w")
    if f == nil then return end

    vim.notify("Saved command '" .. cmd .. "'", vim.log.levels.INFO)
    f:write(cmd)
    f:close()
end

M.init = function()
    vim.api.nvim_create_user_command("CommandSet", function(opts)
        M.add_cmd(opts.args)
    end, { nargs = "?" })

    vim.api.nvim_create_user_command("CommandGet", function(opts)
        M.get_cmd()
    end, { nargs = 0 })
end

M.init()
vim.keymap.set("n", "<C-c>", M.run_cmd)

return M
