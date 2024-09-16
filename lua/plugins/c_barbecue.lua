local M = {}

M.lazy = {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons",
    },
}

M.init = function()
    require("barbecue").setup()
end

return M
