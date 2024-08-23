local M = {}

M.lazy = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        ---@diagnostic disable-next-line: missing-fields
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "bash", "c", "html", "lua", "markdown", "vim", "vimdoc" },
            ignore_install = { "yaml" },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}

return M
