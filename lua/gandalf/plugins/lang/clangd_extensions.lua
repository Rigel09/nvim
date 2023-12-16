local M = {
  'p00f/clangd_extensions.nvim',
  config = true,
  keys = {
    { '<leader>sh', '<cmd>ClangdSwitchSourceHeader<cr>', desc = 'C++ Swap header and source files' },
  },
}

return M
