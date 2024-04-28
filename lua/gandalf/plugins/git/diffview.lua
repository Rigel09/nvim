local M = {
  'sindrets/diffview.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('diffview').setup()
  end,
  keys = {
    { '<leader>dvo', '<cmd>DiffviewOpen<cr>', desc = 'Opens Diff View' },
    { '<leader>dvc', '<cmd>DiffviewClose<cr>', desc = 'Opens Diff View' },
  },
}

return M
