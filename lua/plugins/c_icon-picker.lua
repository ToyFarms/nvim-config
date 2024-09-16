local M = {}

M.lazy = {
    "ziontee113/icon-picker.nvim",
    dependencies = { "stevearc/dressing.nvim" }
}

M.init = function()
    require("icon-picker").setup({ disable_legacy_commands = true })
end

return M
