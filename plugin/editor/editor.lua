vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim', -- spelunk.nvim For window drawing utilities
  'https://github.com/nvim-treesitter/nvim-treesitter', -- spelunk.nvim
  'https://github.com/EvWilson/spelunk.nvim',
  'https://github.com/folke/which-key.nvim',
  'https://github.com/dzfrias/arena.nvim',
  'https://github.com/MagicDuck/grug-far.nvim',
  'https://github.com/chrisgrieser/nvim-rip-substitute',
  'https://github.com/christoomey/vim-tmux-navigator',
}

require('spelunk').setup {
  enable_persist = true,
  fuzzy_search_provider = 'native',
}
require('which-key').setup()
require('arena').setup()
require('grug-far').setup {}

local km = vim.keymap.set
km('n', '<leader>at', '<cmd>lua require("arena").toggle {}<cr>', { desc = 'Arena Toggle' })
km(
  { 'n', 'x' },
  '<leader>fs',
  '<cmd>lua require("rip-substitute").sub()<cr>',
  { desc = ' rip substitute' }
)
