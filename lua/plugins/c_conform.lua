local M = {}

M.lazy = {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "black" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            typescriptreact = { "prettier" },
            javascriptreact = { "prettier" },
            json = { "prettier" },
            html = { "prettier" },
            css = { "prettier" },
            c = { "clang-format" },
        },
    },
}

return M
