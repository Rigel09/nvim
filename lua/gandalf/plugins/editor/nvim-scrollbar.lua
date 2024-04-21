local M = {
  'petertriho/nvim-scrollbar',
  config = function()
    require('scrollbar').setup {
      handle = {
        hide_if_all_visible = false,
      },
      marks = {

        GitAdd = { color = '#2EA043' },
        GitDelete = { color = '#F85149' },
        GitChange = { color = '#0078D4' },
      },
      handlers = {
        gitsigns = true,
      },
    }
  end,
}

return M
