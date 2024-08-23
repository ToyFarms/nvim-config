local M = {}

M.lazy = {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
        require("mini.align").setup()
    end,
}

return M
