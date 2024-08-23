local M = {}

M.lazy = {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 200
    end,
    opts = {},
}

return M
