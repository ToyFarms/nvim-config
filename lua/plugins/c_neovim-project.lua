local M = {}

M.lazy = {
    "coffebar/neovim-project",
    opts = {
        picker = {
            type = "telescope"
        }
    },
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "Shatur/neovim-session-manager" },
    }
}

return M
