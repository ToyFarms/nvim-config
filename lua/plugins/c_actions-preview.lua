local M = {}

M.lazy = {
    "aznhe21/actions-preview.nvim"
}

M.init = function()
    vim.keymap.set("n", "<Leader>ca", require("actions-preview").code_actions)
end

return M
