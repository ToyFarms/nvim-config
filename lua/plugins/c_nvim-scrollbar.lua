local M = {}

M.lazy = {
    "petertriho/nvim-scrollbar"
}

function M.init()
    require("scrollbar").setup()
end

return M
