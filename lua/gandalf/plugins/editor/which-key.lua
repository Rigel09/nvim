local M = {
  'folke/which-key.nvim',
  -- event = "VeryLazy",
  config = function()
    require('which-key').setup()
  end,
  -- TODO: Add configuration for all of my custom mappings
}

return M
