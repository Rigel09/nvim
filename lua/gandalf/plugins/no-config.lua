local M = {

  --- Git related plugins
  'tpope/vim-fugitive', --- Git plugin
  'tpope/vim-rhubarb', --- Allows you to open git URLS?

  --- Detect tabstop and shiftwidth automatically
  --- Changes tab width based on the file being modified
  'tpope/vim-sleuth',

  -- ***************************************
  -- Editor
  -- ***************************************
  { 'nvim-tree/nvim-web-devicons', lazy = true },
  { 'MunifTanjim/nui.nvim', lazy = true },

  -- ***************************************
  -- Misc
  -- ***************************************
  { 'nvim-lua/plenary.nvim', lazy = true },
}
return M
