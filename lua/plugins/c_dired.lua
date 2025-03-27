local M = {}

M.lazy = {
    -- "X3eRo0/dired.nvim",
    "ToyFarms/dired.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
}

function M.init()
    require("dired").setup({
        show_icons = true,
        keybinds = {
            dired_enter = "<cr>",
            dired_back = "-",
            dired_up = "_",
            dired_rename = "r",
            dired_create = "a",
            dired_delete = "d",
            dired_delete_range = "d",
            dired_copy = "y",
            dired_copy_range = "y",
            dired_copy_marked = "my",
            dired_move = "x",
            dired_move_range = "x",
            dired_move_marked = "mx",
            dired_paste = "p",
            dired_mark = "m",
            dired_mark_range = "m",
            dired_delete_marked = "md",
            dired_toggle_hidden = ".",
            dired_toggle_sort_order = ",",
            dired_toggle_icons = "*",
            dired_toggle_colors = "c",
            dired_toggle_hide_details = "(",
            dired_quit = "q",
        },
    })
end

return M
