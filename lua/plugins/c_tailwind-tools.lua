local M = {}

M.lazy = {
    "luckasRanarison/tailwind-tools.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {}
}

M.init = function()
    require("tailwind-tools").setup({})
end

return M
