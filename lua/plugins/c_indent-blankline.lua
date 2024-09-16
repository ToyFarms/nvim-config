local M = {}

M.lazy = {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
}

M.init = function()
    -- require("ibl").setup()
    local highlight = {
        "Cyan",
    }

    local hooks = require("ibl.hooks")
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "Cyan", { fg = "#56B6C2" })
    end)

    require("ibl").setup { indent = { highlight = highlight } }
end

return M
