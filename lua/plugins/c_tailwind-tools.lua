local M = {}

M.lazy = {
    "luckasRanarison/tailwind-tools.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {}
}

function M.init()
    require("tailwind-tools").setup({})
end

return M
