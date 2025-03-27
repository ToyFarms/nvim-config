local M = {}

M.lazy = {
    "3rd/image.nvim",
    build = false,
}

function M.init()
    require("image").setup({})
end

return M
