local M = {}

M.lazy = {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
}

function M.init()
    require("lualine").setup({
        options = {
            theme = require("lualine.themes.onedark"),
        },
    })
end

return M
