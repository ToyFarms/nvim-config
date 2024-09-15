local M = {}

M.lazy = {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
}

M.init = function()
    require("lsp_signature").setup({
        hint_prefix = "@ ",
    })
end

return M
