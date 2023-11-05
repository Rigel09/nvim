local M = {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  lazy = false,
  enabled = false,
  config = function()
    -- Only call setup if we change the defaults
    -- require("catppuccin").setup()
    vim.cmd.colorscheme 'catppuccin'
  end,
}

return M
