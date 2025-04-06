local M = {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'hyper',
      config = {
        week_header = {
          enable = true,
        },
        shortcut = {
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Files',
            group = 'Label',
            action = 'FzfLua find_files',
            key = 'f',
          },
        },
        project = { enable = false },
        mru = { enable = false },
      },
    }
  end,

  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}

return M
