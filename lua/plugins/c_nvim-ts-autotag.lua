local M = {}

M.lazy = {
    "windwp/nvim-ts-autotag"
}

M.init = function()
    require("nvim-ts-autotag").setup()
end

return M
