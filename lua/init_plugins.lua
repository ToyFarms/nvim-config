local M = {}

local function table_map(map, fn)
    local ret = {}
    for _, v in pairs(map) do
        table.insert(ret, fn(v))
    end
    return ret
end

local function convert_custom_plugin(plugin)
    if type(plugin) ~= "table" then return plugin end
    if plugin.lazy == nil or type(plugin.lazy) ~= "table" then return plugin end

    return plugin.lazy
end

M.init = function()
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        local lazyrepo = "https://github.com/folke/lazy.nvim.git"
        vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    end
    vim.opt.rtp:prepend(lazypath)

    local plugins = {
        { "folke/tokyonight.nvim", lazy = false, priority = 1000 },
        { "rebelot/kanagawa.nvim", lazy = false, priority = 1000 },
        { "ellisonleao/gruvbox.nvim", lazy = false, priority = 1000 },
        { "akinsho/toggleterm.nvim", version = "*", config = true },
        { "olimorris/onedarkpro.nvim" },
        {
            "ray-x/lsp_signature.nvim",
            event = "VeryLazy",
            opts = {
                hint_prefix = "@ ",
            },
            config = function(_, opts)
                require("lsp_signature").setup(opts)
            end,
        },
        {
            'fei6409/log-highlight.nvim',
            config = function()
                require('log-highlight').setup {}
            end,
        },
        { "yorickpeterse/nvim-window", config = true },
        { "tpope/vim-dadbod" },
        { "kristijanhusak/vim-dadbod-ui" },
        { "kristijanhusak/vim-dadbod-completion" },
        "tpope/vim-sleuth",
        "windwp/nvim-ts-autotag",
        require("plugins.c_cmake-tools"),
        require("plugins.c_Comment"),
        require("plugins.c_neogit"),
        require("plugins.c_nvim-tree"),
        require("plugins.c_gitsigns"),
        require("plugins.c_which-key"),
        require("plugins.c_telescope"),
        require("plugins.c_lspconfig"),
        require("plugins.c_conform"),
        require("plugins.c_nvim-cmp"),
        require("plugins.c_todo-comments"),
        require("plugins.c_nvim-treesitter"),
        require("plugins.c_lualine"),
        require("plugins.c_harpoon"),
        require("plugins.c_multicursors"),
        require("plugins.c_nvim-surround"),
        require("plugins.c_nvim-autopairs"),
        require("plugins.c_auto-save"),
        require("plugins.c_nvim-scrollbar"),
        require("plugins.c_bufferline"),
        require("plugins.c_nvim-dap"),
        require("plugins.c_nvim-ts-autotag"),
        require("plugins.c_tailwind-tools"),
        require("plugins.c_mini"),
    }

    require("lazy").setup({ unpack(table_map(plugins, convert_custom_plugin)) })

    for _, v in pairs(plugins) do
        if type(v) ~= "table" then goto continue end
        if v.lazy == nil then goto continue end
        if not vim.is_callable(v.init) then goto continue end

        v.init()

        ::continue::
    end
end

return M
