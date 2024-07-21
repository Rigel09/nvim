local M = {
  'linux-cultist/venv-selector.nvim',
  dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim' },
  opts = {
    -- Your options go here
    -- name = "venv",
    -- auto_refresh = false
    fd_binary_name = 'fdfind',
  },
  lazy = false,
  branch = 'regexp',
  keys = {
    -- Keymap to open VenvSelector to pick a venv.
    { '<leader>vs', '<cmd>:VenvSelect<cr>', { desc = 'Select python venv' } },
  },
  config = true,
}

return M
