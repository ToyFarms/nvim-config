local M = {}

M.lazy = {
    "petertriho/nvim-scrollbar"
}

M.init = function()
    require("scrollbar").setup()
end

return M
