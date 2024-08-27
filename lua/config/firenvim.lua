vim.g.firenvim_config = {
    globalSettings = { alt = "all" },
    localSettings = {
        [".*"] = {
            cmdline  = "neovim",
            content  = "text",
            priority = 0,
            selector = "textarea",
            takeover = "never"
        },
        ["https?://(www\\.)?google\\.com"] = {
            takeover = "never",
            priority = 1,
        }
    }
}
