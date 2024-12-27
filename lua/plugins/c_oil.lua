local M = {}

M.lazy = {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
}

function _G.get_oil_winbar()
    local dir = require("oil").get_current_dir()
    if dir then
        return vim.fn.fnamemodify(dir, ":~")
    else
        -- If there is no current directory (e.g. over ssh), just show the buffer name
        return vim.api.nvim_buf_get_name(0)
    end
end

function M.init()
    require("oil").setup({
        skip_confirm_for_simple_edits = true,
        columns = {
            "permissions",
            "size",
            "mtime",
            "icon",
        },
        use_default_keymaps = false,
        keymaps = {
            ["<Tab>"] = "actions.preview",
            ["<CR>"] = "actions.select",
            ["g?"] = { "actions.show_help", mode = "n" },
            ["-"] = { "actions.parent", mode = "n" },
            ["_"] = { "actions.open_cwd", mode = "n" },
            ["`"] = { "actions.cd", mode = "n" },
            ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
            ["<C-c>"] = { "actions.close", mode = "n" },
        },
        win_options = {
            winbar = "%!v:lua.get_oil_winbar()",
        },
    })
end

return M
