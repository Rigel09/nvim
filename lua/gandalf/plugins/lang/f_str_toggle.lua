local M = {
  'roobert/f-string-toggle.nvim',
  config = function()
    require('f-string-toggle').setup {
      key_binding = '<leader>sf',
      key_binding_desc = 'Toggle f-string',
    }
  end,
}
return M
