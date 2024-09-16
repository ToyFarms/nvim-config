local M = {}

M.lazy = {
    'fei6409/log-highlight.nvim'
}

function M.init()
    require('log-highlight').setup({})
end

return M
