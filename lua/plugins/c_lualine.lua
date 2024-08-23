local M = {}

M.lazy = {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
}

M.init = function()
    require("lualine").setup({
        options = {
            theme = require("lualine.themes.onedark"),
        },
    })
end

return M
