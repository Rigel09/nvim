local M = {
  'nanozuki/tabby.nvim',
  event = 'VimEnter',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    -- configs...
    require('tabby').setup()
    require('tabby.tabline').use_preset('active_wins_at_tail', { buf_name = { mode = 'shorten' } })
  end,
}

return M
