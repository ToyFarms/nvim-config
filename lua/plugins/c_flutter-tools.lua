local M = {}

M.lazy = {
    "nvim-flutter/flutter-tools.nvim",
}

function M.init()
    require("flutter-tools").setup({})
end

return M
