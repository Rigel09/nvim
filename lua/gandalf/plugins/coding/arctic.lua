local M = {
  'rockyzhang24/arctic.nvim',
  branch = 'v2',
  dependencies = { 'rktjmp/lush.nvim' },
  config = function()
    vim.cmd 'colorscheme arctic'
  end,
}

return M
