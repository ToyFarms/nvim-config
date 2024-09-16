local M = {}

M.lazy = {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
}

M.init = function()
    require("bufferline").setup({
        options = {
            separator_style = "thin",
            diagnostics = "nvim_lsp",
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File",
                    text_align = "center",
                    separator = true,
                },
            },
            indicator = {
                icon = "▌",
                "icon",
            },
            tab_size = 10,
            show_buffer_close_icons = false,
            show_tab_indicators = true,
            custom_areas = {
                right = function()
                    local result = {}
                    local seve = vim.diagnostic.severity
                    local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
                    local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
                    local info = #vim.diagnostic.get(0, { severity = seve.INFO })
                    local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

                    if error ~= 0 then
                        table.insert(result, { text = "  " .. error, fg = "#EC5241" })
                    end

                    if warning ~= 0 then
                        table.insert(result, { text = "  " .. warning, fg = "#EFB839" })
                    end

                    if hint ~= 0 then
                        table.insert(result, { text = "  " .. hint, fg = "#A3BA5E" })
                    end

                    if info ~= 0 then
                        table.insert(result, { text = " " .. info, fg = "#7EA9A7" })
                    end
                    return result
                end,
            }
        },
    })
end

return M
