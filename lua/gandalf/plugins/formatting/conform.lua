local slow_format_filetypes = {}

local M = {
  'stevearc/conform.nvim',
  lazy = true,
  event = { 'BufReadPre', 'BufNewFile' }, -- to disable, comment this out

  keys = {

    { '<leader>fd', '<cmd>FormatDisable<cr>', desc = 'Disable autoformat-on-save' },
    { '<leader>fE', '<cmd>FormatEnable<cr>', desc = 'Enabled autoformat-on-save' },
  },
  config = function()
    local conform = require 'conform'

    conform.setup {
      formatters_by_ft = {
        json = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
        lua = { 'stylua' },
        python = { 'black' },
        sh = { 'shellcheck', 'shellharden', 'shfmt' },
      },
      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end

        -- Run slow formatters async
        if slow_format_filetypes[vim.bo[bufnr].filetype] then
          return
        end
        local function on_format(err)
          if err and err:match 'timeout$' then
            slow_format_filetypes[vim.bo[bufnr].filetype] = true
          end
        end

        return { timeout_ms = 200, lsp_fallback = true }, on_format
      end,

      format_after_save = function(bufnr)
        if not slow_format_filetypes[vim.bo[bufnr].filetype] then
          return
        end
        return { lsp_fallback = true }
      end,

      formatters = {
        shellcheck = {
          prepend_args = function(self, ctx)
            return { '-x' }
          end,
        },
      },
    }

    conform.formatters.shellcheck = {
      prepend_args = { '-x' },
      -- The base args are { "-filename", "$FILENAME" } so the final args will be
      -- { "-i", "2", "-filename", "$FILENAME" }
    }

    vim.api.nvim_create_user_command('FormatDisable', function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
      require 'notify' 'Disabled autoformat-on-save'
    end, {
      desc = 'Disable autoformat-on-save',
      bang = true,
    })
    vim.api.nvim_create_user_command('FormatEnable', function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
      require 'notify' 'Enabled autoformat-on-save'
    end, {
      desc = 'Re-enable autoformat-on-save',
    })
  end,
}

return M
