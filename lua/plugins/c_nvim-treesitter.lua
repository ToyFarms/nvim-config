local M = {}

M.lazy = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        ---@diagnostic disable-next-line: missing-fields
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "bash", "c", "python", "html", "lua", "markdown", "vim", "vimdoc" },
            ignore_install = { "yaml" },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = false },
        })
    end,
}

return M
