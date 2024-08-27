require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "python",
    "cpp",
    "lua",
    "vim",
    "json",
    "javascript",
    "typescript",
    "ruby",
    "terraform",
    "yaml",
    "json",
    "markdown",
    "sql",
    "html",
    "css",
    "c",
    "c_sharp",
    "cmake",
    "make",
    "rust",
  },
  ignore_install = {}, -- List of parsers to ignore installing
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { 'help', 'make' }, -- list of language that will be disabled
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      scope_incremental = '<CR>',
      node_incremental = '<TAB>',
      node_decremental = '<S-TAB>',
    },
  },
}
