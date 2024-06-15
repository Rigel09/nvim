local M = {
  'mbbill/undotree',
  keys = {
    { '<leader>uu', vim.cmd.UndotreeToggle, desc = 'Toggle Undo Tree' },
  },
}

return M
