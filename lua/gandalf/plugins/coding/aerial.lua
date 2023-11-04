local M = {
  'stevearc/aerial.nvim',
  event = 'VeryLazy',
  -- Optional dependencies
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
    'nvim-telescope/telescope.nvim',
  },

  -- on_attach = function(buffnr)
  config = function()
    require('aerial').setup {
      on_attach = function(buffnr)
        vim.keymap.set('n', '<leader>{', '<cmd>AerialPrev<CR>', { buffer = buffnr, desc = 'Aerial Prev Symbol' })
        vim.keymap.set('n', '<leader>}', '<cmd>AerialNext<CR>', { buffer = buffnr, desc = 'Aerial Next Symbol' })
      end,
      require('telescope').load_extension 'aerial',
      vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>', { desc = 'Toggles Aerial Side View' }),
      vim.keymap.set('n', '<leader>fa', '<cmd>Telescope aerial<CR>', { desc = 'Aerial GOTO Symbol' }),
    }
  end,
}

return M
