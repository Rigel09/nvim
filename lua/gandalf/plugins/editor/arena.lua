local M = {
  'dzfrias/arena.nvim',
  event = 'BufWinEnter',
  keys = {

    {
      '<leader>at',
      function()
        require('arena').toggle {}
      end,
      desc = 'Arena Toggle',
    },
  },
  -- Calls `.setup()` automatically
  config = true,
}

return M
