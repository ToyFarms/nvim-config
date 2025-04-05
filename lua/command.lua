-- vim.cmd([[autocmd VimEnter * silent! lcd %:p:h]])

local function get_define_name(path)
    local filename = path:match("[^/\\]+$")
    local name = "__" .. filename:gsub("%.[^.]+$", "") .. filename:match("%..*"):gsub("%.", "_")
    name = name:upper()

    return name
end

vim.api.nvim_create_user_command("IncludeGuard", function(opts)
    local name = opts.args
    if name == "" then name = get_define_name(vim.api.nvim_buf_get_name(0)) end

    local cursor = vim.api.nvim_win_get_cursor(0)
    local original_row, original_col = unpack(cursor)
    vim.api.nvim_win_set_cursor(0, { 1, 0 })
    vim.api.nvim_put({ "#ifndef " .. name, "#define " .. name, "", "" }, "c", false, false)

    local line_num = vim.fn.line("$")
    local last_col = (vim.api.nvim_buf_get_lines(0, line_num - 1, line_num, false)[1]):len()
    vim.api.nvim_win_set_cursor(0, { line_num, last_col })
    vim.api.nvim_put({ "", "", "#endif /* " .. name .. " */" }, "c", true, false)

    vim.api.nvim_win_set_cursor(0, { original_row + 3, original_col })
end, { desc = "Generate include guard", nargs = "?" })

vim.api.nvim_create_user_command("IncludeGuardUpdate", function(opts)
    local name = opts.args
    if name == "" then name = get_define_name(vim.api.nvim_buf_get_name(0)) end

    vim.api.nvim_buf_set_lines(0, 0, 2, false, { "#ifndef " .. name, "#define " .. name })
    vim.api.nvim_buf_set_lines(0, -2, -1, false, { "#endif /* " .. name .. " */" })
end, { nargs = "?" })

vim.api.nvim_create_user_command("Format", function(_)
    require("conform").format({ async = true, lsp_fallback = true })
end, { nargs = 0 })
