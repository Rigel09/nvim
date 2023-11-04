local M = {
  'nvim-telescope/telescope-fzf-native.nvim',
  build = 'make',
  enabled = vim.fn.executable 'make' == 1,
  config = function()
    require('telescope').setup()
    require('telescope').load_extension 'fzf'
  end,
}

return M
