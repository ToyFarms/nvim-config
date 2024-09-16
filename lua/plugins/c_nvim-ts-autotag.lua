local M = {}

M.lazy = {
    "windwp/nvim-ts-autotag"
}

function M.init()
    require("nvim-ts-autotag").setup()
end

return M
