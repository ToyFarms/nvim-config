local M = {}

M.lazy = {
    'fei6409/log-highlight.nvim'
}

M.init = function()
    require('log-highlight').setup({})
end

return M
