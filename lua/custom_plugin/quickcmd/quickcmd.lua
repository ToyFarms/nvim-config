local M = {}

local quickcmd_db = vim.fn.stdpath("data") .. "quickcmd.txt"

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

function M.init()
    vim.api.nvim_create_user_command("CommandSet", function(opts)
        M.add_cmd(opts.args)
    end, { nargs = "?" })

    --- @diagnostic disable-next-line
    vim.api.nvim_create_user_command("CommandGet", function(opts)
        M.get_cmd()
    end, { nargs = 0 })

    vim.keymap.set("n", "<Leader>l", function()
        local winnr = vim.api.nvim_get_current_win()
        local pos = vim.api.nvim_win_get_cursor(winnr)

        vim.cmd('TermExec cmd="" go_back=0')
        vim.cmd('startinsert')
        local keys = vim.api.nvim_replace_termcodes("<Up><Enter>", true, false, true)
        vim.api.nvim_feedkeys(keys, "n", false)

        vim.schedule(function ()
            vim.cmd('stopinsert')
            vim.api.nvim_set_current_win(winnr)
            vim.api.nvim_win_set_cursor(winnr, pos)
        end)
    end)
end

-- M.init

return M
