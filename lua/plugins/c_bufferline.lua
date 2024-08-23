local M = {}

M.lazy = {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
}

M.init = function()
    require("bufferline").setup({
        options = {
            separator_style = "slant",
            diagnostics = "nvim_lsp",
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    highlight = "Directory",
                    separator = true,
                },
            },
            indicator = {
                style = "underline",
            },
        },
    })
end

return M
