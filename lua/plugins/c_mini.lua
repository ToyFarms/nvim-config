local M = {}

M.lazy = {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
        require("mini.align").setup()
        require("mini.move").setup()
        require("mini.pairs").setup()
        require("mini.surround").setup()
        require("mini.jump2d").setup()
    end,
}

return M
