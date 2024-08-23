local M = {}

M.lazy = {
    "Civitasv/cmake-tools.nvim",
}

M.init = function()
    require("cmake-tools").setup({})
end

return M
