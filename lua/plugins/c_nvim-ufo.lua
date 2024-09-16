local M = {}

M.lazy = {
    "https://github.com/kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" }
}

function M.init()
    vim.o.foldcolumn = "1"
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

    require("ufo").setup({
        provider_selector = function(bufnr, filetype, buftype)
            _, _, _ = bufnr, filetype, buftype
            return { "treesitter", "indent" }
        end
    })
end

return M
