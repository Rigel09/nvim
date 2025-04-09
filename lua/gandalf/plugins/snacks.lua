local M = {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  -- opts = {
  --   -- your configuration comes here
  --   -- or leave it empty to use the default settings
  --   -- refer to the configuration section below
  --   bigfile = { enabled = true },
  --   dashboard = { enabled = true },
  --   indent = { enabled = true },
  --   input = { enabled = true },
  --   lazygit = { enabled = true },
  --   notifier = { enabled = true },
  --   picker = { enabled = true },
  --   rename = { enabled = true },
  --   quickfile = { enabled = true },
  --   scope = { enabled = true },
  --   scroll = { enabled = true },
  --   statuscolumn = { enabled = true },
  --   words = { enabled = true },
  -- },
  config = function()
    local snacks = require 'snacks'
    snacks.setup {
      --
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      bufdelete = { enabled = true },
      dashboard = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      lazygit = { enabled = true },
      notifier = { enabled = true },
      picker = { enabled = true },
      rename = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    }

    local prev = { new_name = '', old_name = '' } -- Prevents duplicate events
    vim.api.nvim_create_autocmd('User', {
      pattern = 'NvimTreeSetup',
      callback = function()
        local events = require('nvim-tree.api').events
        events.subscribe(events.Event.NodeRenamed, function(data)
          if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
            data = data
            snacks.rename.on_rename_file(data.old_name, data.new_name)
          end
        end)
      end,
    })
  end,
}

return M
