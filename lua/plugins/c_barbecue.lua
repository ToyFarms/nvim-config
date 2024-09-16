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

function M.init()
    require("barbecue").setup()
end

return M
