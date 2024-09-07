local M = {
  'rbong/vim-flog',
  lazy = true,
  cmd = { 'Flog', 'Flogsplit', 'Floggit' },
  keys = {
    { '<leader>fg', '<cmd>Flog -order=date<CR>', desc = 'Show Flog git graph ordered by date' },
  },
  dependencies = {
    'tpope/vim-fugitive',
  },
}

return M
