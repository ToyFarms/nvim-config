local M = {}

M.lazy = {
    "okuuva/auto-save.nvim",
    opts = {
        debounce_delay = 1000,
    },
}

M.init = function()
    -- auto-save "enabled=false" doesn't work, so we just toggle it manually
    vim.cmd("ASToggle")
end

return M
