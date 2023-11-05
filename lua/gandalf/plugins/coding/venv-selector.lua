local M = {
  'linux-cultist/venv-selector.nvim',
  dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim' },
  opts = {
    -- Your options go here
    -- name = "venv",
    -- auto_refresh = false
    fd_binary_name = 'fdfind',
  },
  -- config = true,
  event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
  keys = {
    -- Keymap to open VenvSelector to pick a venv.
    { '<leader>vs', '<cmd>:VenvSelect<cr>', { desc = 'Select python venv' } },

    -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
    { '<leader>vc', '<cmd>:VenvSelectCached<cr>', { desc = 'Grab prev python env' } },
  },
}

return M
