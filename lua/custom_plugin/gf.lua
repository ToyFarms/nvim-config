local M = {}

G = {}
G.prev_winnr = -1

vim.api.nvim_create_autocmd("WinLeave", {
    callback = function()
        G.prev_winnr = vim.api.nvim_get_current_win()
    end
})

local function str_startswith(str, substr)
    return string.sub(str, 1, string.len(substr)) == substr
end

local function str_split(str, delim)
    local result = {}
    for match in (str .. delim):gmatch("(.-)" .. delim) do
        table.insert(result, match)
    end
    return result
end

local function str_get_inbetween(str, left, right)
    return str:match(left .. "(.-)" .. right)
end

local function str_get_integers(str)
    local integers = {}
    for integer in str:gmatch("%d+") do
        table.insert(integers, tonumber(integer))
    end
    return integers
end

local function str_strip(str)
    return str:gsub("^%s*(.-)%s*$", "%1")
end

local function table_map(table, fn)
    local result = {}
    for k, v in pairs(table) do
        result[k] = fn(v)
    end
    return result
end

Windows = "windows"
Linux = "linux"
OSx = "osx"

local function get_os()
    ---@diagnostic disable-next-line
    local sys = vim.loop.os_uname().sysname:lower()
    if sys:find("windows") then
        return Windows
    elseif sys:find("linux") then
        return Linux
    elseif sys:find("darwin") then
        return OSx
    end
end

local function get_open_cmd()
    local os = get_os()
    if os == Windows then
        return "start"
    elseif os == Linux then
        return "xdg-open"
    elseif os == OSx then
        return "open"
    end
end

local function file_exists(path)
    local file = io.open(path, "r")
    if file then
        io.close(file)
        return true
    else
        return false
    end
end

local function path_get_loc_as_str(path)
    local pos = path:match(":[%d]+:[%d]+")
    if pos == nil then
        pos = path:match(":%d+")
        if pos == nil then return nil end
    end

    return pos:sub(2, -1)
end

local function path_get_loc(path)
    local pos = path_get_loc_as_str(path)
    if pos == nil then return { 1, 0 } end

    local row, col = unpack(str_get_integers(pos))
    if row == nil then row = "1" end
    if col == nil then col = "0" end

    return { tonumber(row), tonumber(col) }
end

local function path_sub_loc(path)
    local loc = path_get_loc_as_str(path)
    if loc == nil then return path end

    local loc_start = path:find(loc)
    return path:sub(1, loc_start - 1):sub(1, -2)
end

---@return integer
M.goto_link_url = function(url)
    vim.fn.systemlist(get_open_cmd() .. ' "' .. url .. '"')
    return vim.v.shell_error
end

local function path_same(a, b)
    ---@diagnostic disable-next-line
    return vim.loop.fs_realpath(a) == vim.loop.fs_realpath(b)
end

local function name_from_win(winnr)
    return vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(winnr))
end

local function add_jump()
    vim.api.nvim_feedkeys("m'", "n", false)
end

M.goto_link_file = function(path)
    if path:find("~") then
        path = vim.fn.expand(path)
    end
    local row, col = unpack(path_get_loc(path))
    path = path_sub_loc(path)
    if not file_exists(path) then return -1 end

    if row == nil or row < 1 then row = 1 end
    if col == nil or col < 0 then col = 0 end

    add_jump()

    local windows = vim.api.nvim_list_wins()
    local found = false
    for _, winnr in ipairs(windows) do
        if path_same(path, name_from_win(winnr)) then
            vim.api.nvim_set_current_win(winnr)
            found = true
            break
        end
    end

    if not found then
        if vim.api.nvim_win_is_valid(G.prev_winnr) then
            vim.api.nvim_set_current_win(G.prev_winnr)
        end
        vim.api.nvim_command("edit " .. path)
    end

    vim.api.nvim_win_set_cursor(0, { math.min(row, vim.fn.line("$")), math.max(0, col - 1) })

    return 0
end

M.goto_link = function(link)
    if link == nil or link == "" then return -1 end
    local is_link_file = not str_startswith(link, "http")

    if is_link_file then
        return M.goto_link_file(link)
    else
        return M.goto_link_url(link)
    end
end

local function get_word_separated_by(str, loc, sep_left, sep_right)
    if sep_right == nil then sep_right = sep_left end

    local left_bound = 0
    for i = loc, 0, -1 do
        local char = str:sub(i, i)
        if char == sep_left then
            left_bound = i + 1
            break
        end
    end

    local right_bound = -1
    for i = loc + 1, #str do
        local char = str:sub(i, i)
        if char == sep_right or char == "\n" then
            right_bound = i - 1
            break
        end
    end

    return str:sub(left_bound, right_bound)
end

local separator = { { " ", " " }, { "'", "'" }, { '"', '"' }, { "[", "]" }, { "(", ")" }, { "{", "}" }, { "|", "|" } }

M.get_link_under_cursor = function()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local row_content = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1]

    local ret = -1
    local i = 1
    local link
    while ret ~= 0 and i < #separator + 1 do
        link = get_word_separated_by(row_content, col, separator[i][1], separator[i][2])
        ret = M.goto_link(link)
        i = i + 1
    end
    if ret ~= 0 then vim.notify("Error opening '" .. link .. "'", vim.log.levels.ERROR) end
end

local function get_selected_text()
    local _, start_line, start_col, _ = unpack(vim.fn.getpos("v"))
    local end_line, end_col = unpack(vim.api.nvim_win_get_cursor(0))

    local lines =
        vim.api.nvim_buf_get_lines(0, math.min(start_line, end_line) - 1, math.max(start_line, end_line), false)

    if #lines == 0 then return "" end

    if vim.api.nvim_get_mode().mode == "v" then
        if #lines == 1 then return lines[1]:sub(start_col, end_col + 1) end

        lines[1] = lines[1]:sub(start_col)
        lines[#lines] = lines[#lines]:sub(1, end_col + 1)
    end

    lines = table_map(lines, str_strip)
    return table.concat(lines, "")
end

M.get_link_under_selection = function()
    M.goto_link(get_selected_text())
end

-- vim.keymap.set("n", "gf", M.get_link_under_cursor)
-- vim.keymap.set("v", "gf", M.get_link_under_selection)

return M
