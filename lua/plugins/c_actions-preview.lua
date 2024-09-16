local M = {}

M.lazy = {
    "aznhe21/actions-preview.nvim"
}

function M.init()
    vim.keymap.set("n", "<Leader>ca", require("actions-preview").code_actions)
end

return M
