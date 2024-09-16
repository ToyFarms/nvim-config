local M = {}

M.lazy = {
    "Civitasv/cmake-tools.nvim",
}

function M.init()
    require("cmake-tools").setup({})
end

return M
