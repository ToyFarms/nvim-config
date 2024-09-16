local M = {}

M.lazy = {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
}

function M.init()
    require("lsp_signature").setup({
        hint_prefix = "@ ",
    })
end

return M
