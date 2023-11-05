local M = {
  'navarasu/onedark.nvim',
  priority = 1000,
  lazy = false,
  config = function()
    -- Only call setup if we change the defaults
    require('onedark').setup {
      style = 'deep',
    }
    require('onedark').load()
  end,
}

return M
