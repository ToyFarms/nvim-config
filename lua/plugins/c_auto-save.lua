local M = {}

M.lazy = {
    "okuuva/auto-save.nvim",
    opts = {
        debounce_delay = 1000,
    },
}

function M.init()
    -- auto-save "enabled=false" doesn't work, so we just toggle it manually
    vim.cmd("ASToggle")
end

return M
