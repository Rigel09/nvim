local M = {
  'nvim-tree/nvim-tree.lua',
  event = 'VeryLazy',
  keys = {
    {
      '<leader>fc',
      function()
        local api = require 'nvim-tree.api'

        if api.tree.is_visible() then
          api.tree.close()
        else
          api.tree.open()
        end
      end,
      desc = 'Toggles Nvim Tree',
    },
  },
  config = function()
    require('nvim-tree').setup {
      filters = {
        dotfiles = false,
        exclude = { vim.fn.stdpath 'config' .. '/lua/custom' },
      },
      disable_netrw = true,
      hijack_netrw = true,
      hijack_cursor = true,
      hijack_unnamed_buffer_when_opening = false,
      sync_root_with_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      view = {
        adaptive_size = false,
        side = 'left',
        width = 60,
        preserve_window_proportions = true,
      },
      git = {
        enable = true,
        ignore = true,
      },
      filesystem_watchers = {
        enable = true,
      },
      actions = {
        open_file = {
          resize_window = true,
        },
        change_dir = {
          enable = true,
          global = false,
          restrict_above_cwd = false,
        },
      },
      renderer = {
        root_folder_label = true,
        highlight_git = true,
        highlight_opened_files = 'all',

        indent_markers = {
          enable = false,
        },

        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },

          glyphs = {
            default = '󰈚',
            symlink = '',
            folder = {
              default = '',
              empty = '',
              empty_open = '',
              open = '',
              symlink = '',
              symlink_open = '',
              arrow_open = '',
              arrow_closed = '',
            },
            git = {
              unstaged = '✗',
              staged = '✓',
              unmerged = '',
              renamed = '➜',
              untracked = '★',
              deleted = '',
              ignored = '◌',
            },
          },
        },
      },
    }
  end,
}

return M
