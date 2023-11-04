local M = {
  'ahmedkhalf/project.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  event = 'VeryLazy',
  config = function()
    require('project_nvim').setup {
      -- manual_mode = true,
    }

    require('telescope').load_extension 'projects'
  end,
  keys = {
    { '<leader>fp', '<Cmd>Telescope projects<CR>', desc = 'Telescope Seach Projects' },
  },
}

return M
