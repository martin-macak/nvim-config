local M = {}

function M.setup()
  local dap_install = require "dap-install"
  dap_install.setup {
    installation_path = vim.fn.stdpath "data" .. "/dapinstall/",
  }

  local dap_virtual_text = require("nvim-dap-virtual-text")
  dap_virtual_text.setup({
    enabled = true,                        -- enable this plugin (the default)
    enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    show_stop_reason = true,               -- show stop reason when stopped for exceptions
    commented = false,                     -- prefix virtual text with comment string
    only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
    all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
    clear_on_continue = false,             -- clear virtual text on "continue" (might cause flickering when stepping)
    --- A callback that determines how a variable is displayed or whether it should be omitted
    --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
    --- @param buf number
    --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
    --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
    --- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
    --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
    display_callback = function(variable, buf, stackframe, node, options)
      if options.virt_text_pos == 'inline' then
        return ' = ' .. variable.value
      else
        return variable.name .. ' = ' .. variable.value
      end
    end,
    -- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
    virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'inline' or 'eol',

    -- experimental features:
    all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
    virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
    -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
  })

  local dap_breakpoint = {
    error = {
      text = "🔴",
      texthl = "LspDiagnosticsSignError",
      linehl = "",
      numhl = "",
    },
    rejected = {
      text = "❓",
      texthl = "LspDiagnosticsSignHint",
      linehl = "",
      numhl = "",
    },
    stopped = {
      text = "➡",
      texthl = "LspDiagnosticsSignInformation",
      linehl = "DiagnosticUnderlineInfo",
      numhl = "LspDiagnosticsSignInformation",
    },
  }

  vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
  vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
  vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)

  local dap, dapui = require "dap", require "dapui"
  dapui.setup {} -- use default
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end

  require("config.dap.python").setup()
  require("config.dap.go").setup()
  require("config.dap.nodejs").setup()
  require("config.dap.sh").setup()

  vim.keymap.set('n', '<F5>', ':DapContinue<CR>', { silent = true })
  vim.keymap.set('n', '<F10>', ':DapStepOver<CR>', { silent = true })
  vim.keymap.set('n', '<F11>', ':DapStepInto<CR>', { silent = true })
  vim.keymap.set('n', '<F12>', ':DapStepOut<CR>', { silent = true })
  vim.keymap.set('n', '<F9>', ':DapToggleBreakpoint<CR>', { silent = true })
  vim.keymap.set('n', '<leader>db', ':DapToggleBreakpoint<CR>', { silent = true })
  vim.keymap.set('n', '<leader>dc', ':DapContinue<CR>', { silent = true })
  vim.keymap.set('n', '<leader>dt', ':DapTerminate<CR>', { silent = true })
  vim.keymap.set('n', '<leader>dsi', ':DapStepInto<CR>', { silent = true })
  vim.keymap.set('n', '<leader>dsx', ':DapStepOut<CR>', { silent = true })
  vim.keymap.set('n', '<leader>dso', ':DapStepOver<CR>', { silent = true })
  vim.keymap.set('n', '<leader>dl', ':DapShowLog<CR>', { silent = true })
  vim.keymap.set('n', '<leader>dj', ':DapLoadLaunchJSON<CR>', { silent = true })

end

return M
