local M = {
  'akinsho/bufferline.nvim',
  event = 'VeryLazy',
  keys = {
    { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = 'Toggle pin' },
    { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Delete non-pinned buffers' },
    { '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', desc = 'Delete other buffers' },
    { '<leader>br', '<Cmd>BufferLineCloseRight<CR>', desc = 'Delete buffers to the right' },
    { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', desc = 'Delete buffers to the left' },
  },
  dependencies = {
    'askfiy/visual_studio_code',
  },
  config = function()
    require('bufferline').setup {
      options = {
        diagnostics = 'nvim_lsp',
        themable = true,
        separator_style = 'slant',
        show_buffer_icons = true,
        always_show_bufferline = false,
        --       diagnostics_indicator = function(_, _, diag)
        --         local icons = require("lazyvim.config").icons.diagnostics
        --         local ret = (diag.error and icons.Error .. diag.error .. " " or "")
        --           .. (diag.warning and icons.Warn .. diag.warning or "")
        --         return vim.trim(ret)
        --       end,
        custom_areas = {
          right = require('visual_studio_code').get_bufferline_right(),
        },
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'Neo-tree',
            highlight = 'Directory',
            text_align = 'left',
          },
        },
      },
    }
  end,
}

return M
