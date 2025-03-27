-- used when editing C macro so that i dont have to manually add the backslash

local M = {}

function M.insert_line()
    local current = vim.api.nvim_get_current_line()

    if current:match("\\$") then
        local col = 0
        for i = #current, 1, -1 do
            local c = current:sub(i, i)
            if c == "\\" then
                col = i
                break
            end
        end

        local repl = string.rep(" ", col - 1) .. "\\"

        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("o", true, false, true), "n", true)

        vim.defer_fn(function()
            vim.api.nvim_set_current_line(repl)
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("a<Backspace>", true, false, true), "n", true)
        end, 100)
    else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("o", true, false, true), "n", true)
    end
end

function M.init()
    vim.keymap.set("n", "o", M.insert_line, { noremap = true })
end

return M
