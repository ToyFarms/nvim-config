local M = {}

M.lazy = {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
}

local function file_exists(path)
    local file = io.open(path, "r")
    if file then
        io.close(file)
        return true
    else
        return false
    end
end

function M.init()
    require("dapui").setup()
    local dap = require("dap")

    dap.adapters.codelldb = {
        name = "codelldb",
        type = "server",
        port = "${port}",
        executable = {
            command = vim.fn.stdpath("data") .. "/mason/bin/codelldb.cmd",
            args = { "--port", "${port}" },
        },
    }

    dap.configurations.c = {
        {
            type = "codelldb",
            request = "launch",
            program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            args = function()
                local settings = vim.loop.cwd() .. "/.vscode/settings.json"
                if file_exists(settings) then
                    local file = io.open(settings)
                    if file == nil then goto ask end
                    local content = file:read("*a")
                    local setting = vim.json.decode(content)
                    file:close()
                    return setting["cmake.debugConfig"]["args"]
                end
                ::ask::
                local args_string = vim.fn.input("Input arguments: ")
                return vim.split(args_string, " ")
            end,
            cwd = "${workspaceFolder}",
        },
    }
end

return M
