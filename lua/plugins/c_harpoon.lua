local M = {}

M.lazy = {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
}

M.init = function()
    local harpoon = require("harpoon")
    harpoon:setup()
    vim.keymap.set("n", "=", function()
        harpoon:list():next()
    end)
    vim.keymap.set("n", "-", function()
        harpoon:list():prev()
    end)
    vim.keymap.set("n", "<Leader>a", function()
        harpoon:list():append()
    end)
    vim.keymap.set("n", "<C-e>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
    vim.keymap.set("n", "<C-f>", function()
        harpoon:list():select(1)
    end)
    vim.keymap.set("n", "<C-t>", function()
        harpoon:list():select(2)
    end)
    vim.keymap.set("n", "<C-n>", function()
        harpoon:list():select(3)
    end)
    vim.keymap.set("n", "<C-s>", function()
        harpoon:list():select(4)
    end)
end

return M
