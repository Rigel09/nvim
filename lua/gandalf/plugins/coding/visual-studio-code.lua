local M = {
  -- 'askfiy/visual_studio_code',
  'Rigel09/visual_studio_code',
  priority = 1,
  branch = 'feature/more_like_code',
  lazy = false,
  config = function()
    require('visual_studio_code').setup { mode = 'dark_modern' }
    vim.cmd [[colorscheme visual_studio_code]]
  end,
}

return M
