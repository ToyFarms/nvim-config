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
            jsonc = { "prettier" },
            html = { "prettier" },
            htmldjango = { "prettier" },
            css = { "prettier" },
            c = { "clang-format" },
            rust = { "rust_analyzer" },
            xml = { "xmlformatter" },
        },
    },
}

return M
