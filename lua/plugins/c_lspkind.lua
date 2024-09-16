local M = {}

M.lazy = {
    "onsails/lspkind.nvim",
}

function M.init()
    local lspkind = require('lspkind')
    require("cmp").setup {
        formatting = {
            format = lspkind.cmp_format({
                mode = 'symbol_text',
                maxwidth = 50,
                ellipsis_char = '...',
                show_labelDetails = true,
            })
        }
    }
end

return M
