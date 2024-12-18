local M = {}

M.lazy = {
    "ms-jpq/chadtree"
}

function M.init()
    local chadtree_settings = {
        theme = {
            text_colour_set = "solarized_dark",
        }
    }
    vim.api.nvim_set_var("chadtree_settings", chadtree_settings)
end

return M
