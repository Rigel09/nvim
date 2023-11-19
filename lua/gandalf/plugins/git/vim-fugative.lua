local M = {
  'tpope/vim-fugitive',
  keys = {
    { '<leader>gp', '<cmd>Git push<CR>', { desc = 'Git push with fugitive' } },
    { '<leader>gd', '<cmd>Git diff<CR>', { desc = 'Git diff with fugitive' } },
    { '<leader>gg', '<cmd>Git<CR>', { desc = 'Opens git fugitive' } },
  },
}
return M
