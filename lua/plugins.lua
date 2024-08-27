local api = vim.api
local fn = vim.fn

local utils = require("utils")

local compiled_file_name = "packer_compiled"
if vim.g.vscode ~= nil then
  compiled_file_name = "packer_compiled_vscode"
end

-- The root dir to install all plugins. Plugins are under opt/ or start/ sub-directory.
vim.g.plugin_home = fn.stdpath("data") .. "/site/pack/packer"

--- Install packer if it has not been installed.
--- Return:
--- true: if this is a fresh install of packer 
--- false: if packer has been installed
local function packer_ensure_install()
  -- Where to install packer.nvim -- the package manager (we make it opt)
  local packer_dir = vim.g.plugin_home .. "/opt/packer.nvim"

  if fn.glob(packer_dir) ~= "" then
    return false
  end

  -- Auto-install packer in case it hasn't been installed.
  vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})

  local packer_repo = "https://github.com/wbthomason/packer.nvim"
  local install_cmd = string.format("!git clone --depth=1 %s %s", packer_repo, packer_dir)
  vim.cmd(install_cmd)

  return true
end

local fresh_install = packer_ensure_install()

-- Load packer.nvim
vim.cmd("packadd packer.nvim")

local packer = require("packer")
local packer_util = require("packer.util")

-- check if firenvim is active
local firenvim_not_active = function()
  return not vim.g.started_by_firenvim
end

packer.startup {
  function(use)
    use { 
      "wbthomason/packer.nvim",
      opt = true
    }

    if vim.g.vscode == nil then
      use {
        "williamboman/mason.nvim",
        config = [[require('config.mason')]]
      }

      use {
        "mg979/vim-visual-multi",
      }

      use {
        "tpope/vim-surround",
      }

      use {
        "stevearc/conform.nvim"
      }

      use {
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end,
        config = [[require('config.firenvim')]],
      }

      use {
        'tpope/vim-cucumber',
      }

      use {
        'yaegassy/coc-cucumber',
        run = "yarn install --frozen-lockfile",
        requires = {
          { "neoclide/coc.nvim" }
        }
      }

      use {
        'cameron-wags/rainbow_csv.nvim',
        config = [[require('config.rainbow')]],
        module = {
          'rainbow_csv',
          'rainbow_csv.fns'
        },
        ft = {
          'csv',
          'tsv',
          'csv_semicolon',
          'csv_whitespace',
          'csv_pipe',
          'rfc_csv',
          'rfc_semicolon'
        }
      }

      use {
        "romgrk/barbar.nvim",
        requires = {
          "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
          "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
          opt = true,
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {

        },
      }

      use {
        "iberianpig/tig-explorer.vim"
      }

      use {
        "folke/which-key.nvim",
        config = function()
          vim.o.timeout = true
          vim.o.timeoutlen = 300
          require("which-key").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
          }
        end
      }

      use {
        "nvim-telescope/telescope.nvim",
        requires = { {'nvim-lua/plenary.nvim' } },
        config = [[require('config.telescope')]]
      }

      use {
        "mrjones2014/dash.nvim",
        run = 'make install',
      }

      use {
        "dhruvasagar/vim-table-mode"
      }

      use {
        "liuchengxu/vista.vim",
        config = [[require('config.statusline')]]
      }

      use {
        "github/copilot.vim",
        config = [[require('config.copilot')]],
      }

      --use {
      --"sheerun/vim-polyglot",
      --config = [[require('config.polyglot')]],
      --}

      use {
        "nvim-treesitter/nvim-treesitter",
        event = "BufEnter",
        run = ":TSUpdate",
        config = [[require('config.treesitter')]],
      }

      use {
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
        config = [[require('config.tstextobjects')]],
      }

      use {
        "RRethy/nvim-treesitter-textsubjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
        config = [[require('config.tstextsubjects')]],
      }

      use {
        "pseewald/vim-anyfold",
      }

      use {
        "nvim-lualine/lualine.nvim",
        requires = {
          "nvim-tree/nvim-web-devicons",
          opt = true,
        },
        config = [[require('config.statusline')]],
      }

      use {
        "gelguy/wilder.nvim",
        config = [[require('config.wilder')]],
      }

      use { 
        "neoclide/coc.nvim", 
        config = [[require('config.coc')]],
        branch = 'release',
      }

      use {
        "Yggdroot/LeaderF",
        cmd = "Leaderf",
        event = "VimEnter",
        run = ":LeaderfInstallCExtension",
        config = [[require('config.leaderf')]],
      }

      -- fast navigation
      use {
        "phaazon/hop.nvim",
        event = "VimEnter",
        config = [[require('config.hop')]],
      }

      -- git support
      use {
        "tpope/vim-fugitive",
        event = "VimEnter",
        config = [[require('config.fugitive')]],
      }

      -- git gutter
      use {
        "airblade/vim-gitgutter",
        event = "VimEnter",
        config = [[require('config.gitgutter')]],
      }

      use {
        "sindrets/diffview.nvim"
      }

      -- file explorer
      use {
        "preservim/nerdtree",
        config = [[require('config.nerdtree')]]
      }

      use {
        "dyng/ctrlsf.vim"
      }

      use {
        "vifm/vifm.vim"
      }

      -- adds git support to nerdtree
      use {
        "Xuyuanp/nerdtree-git-plugin",
      }

      use {
        "ryanoasis/vim-devicons",
      }

      use {
        "Raimondi/delimitMate",
        event = "InsertEnter",
      }

      use {
        "preservim/nerdcommenter",
      }

      use {
        "gabesoft/vim-ags",
        config = [[require('config.ags')]],
      }

      use {
        "akinsho/toggleterm.nvim",
        config = [[require('config.toggleterm')]],
      }

      -- Snippets
      use {
        "SirVer/ultisnips",
        event = "InsertEnter",
      }

      use {
        "honza/vim-snippets",
        after = "ultisnips",
      }


      -- Theme
      use {
        "Mofiqul/dracula.nvim",
      }
    else
      -- fast navigation
      use {
        "phaazon/hop.nvim",
        event = "VimEnter",
        config = [[require('config.hop')]],
      }

      use {
        "preservim/nerdcommenter",
      }

      -- Snippets
      use {
        "SirVer/ultisnips",
        event = "InsertEnter",
      }

      use {
        "honza/vim-snippets",
        after = "ultisnips",
      }

    end
  end,
  config = {
    max_jobs = 16,
    compile_path = packer_util.join_paths(fn.stdpath("data"), "site", "lua", compiled_file_name .. ".lua"),
  },
}

-- For fresh install, we need to install plugins. Otherwise, we just need to require `packer_compiled.lua`.
if fresh_install then
  -- We run packer.sync() here, because only after packer.startup, can we know which plugins to install.
  -- So plugin installation should be done after the startup process.
  packer.sync()
else
  local status, _ = pcall(require, compiled_file_name)
  if not status then
    local msg = "File " .. packer_compiled .. ".lua not found: run PackerSync to fix!"
    vim.notify(msg, vim.log.levels.ERROR, { title = "nvim-config" })
  end
end

-- Auto-generate packer_compiled.lua file
api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = "*/nvim/lua/plugins.lua",
  group = api.nvim_create_augroup("packer_auto_compile", { clear = true }),
  callback = function(ctx)
    local cmd = "source " .. ctx.file
    vim.cmd(cmd)
    vim.cmd("PackerCompile")
    vim.notify("PackerCompile done!", vim.log.levels.INFO, { title = "Nvim-config" })
  end,

})

