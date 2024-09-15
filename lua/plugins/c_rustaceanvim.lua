local M = {}

M.lazy = {
    "https://github.com/mrcjkb/rustaceanvim",
    version = "^5",
    lazt = false,
    ["rust-analyzer"] = {
        cargo = {
            allFeatures = true,
        },
        procMacro = {
            enable = true,
        },
    }
}

return M
