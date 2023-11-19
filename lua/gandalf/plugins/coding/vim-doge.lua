local M = {
  'danymat/neogen',
  dependencies = 'nvim-treesitter/nvim-treesitter',
  config = true,
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
  keys = {
    {
      '<leader>nf',
      "<cmd>lua require('neogen').generate {}<CR>",
      desc = 'Creates a docstring fro a function',
    },
    {
      '<leader>nc',
      "<cmd>lua require('neogen').generate { type = 'class' }<CR>",
      desc = 'Creates a docstring for a class',
    },
  },
}

return M
