local M = {}

M.lazy = {
    "mfussenegger/nvim-lint",
    dependencies = {
        "rshkarin/mason-nvim-lint",
    },
}

function M.init()
    require("lint").linters_by_ft = {
        python = { "mypy" },
    }

    require("mason-nvim-lint").setup()

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
            require("lint").try_lint()
        end,
    })
end

return M
