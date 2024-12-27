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
    vim.schedule(function()
        require("barbecue").setup({
            exclude_filetypes = { "netrw", "toggleterm", "dired" },
        })
    end)
end

return M
