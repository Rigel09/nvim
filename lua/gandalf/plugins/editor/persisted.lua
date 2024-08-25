local M = {
  'olimorris/persisted.nvim',
  lazy = false, -- make sure the plugin is always loaded at startup
  dependencies = { 'nvim-telescope/telescope.nvim' },
  keys = {
    { '<leader>ls', '<cmd>Telescope persisted<cr>', desc = 'Select prev session' },
  },
  config = function()
    require('persisted').setup {
      use_git_branch = true,
    }
    require('telescope').load_extension 'persisted'
  end,
}

return M
