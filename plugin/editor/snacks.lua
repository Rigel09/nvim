vim.pack.add {
  'https://github.com/folke/snacks.nvim',
}

snacks = require 'snacks'

snacks.setup {
  bigfile = { enabled = true },
  bufdelete = { enabled = true },
  dashboard = { enabled = false },
  indent = { enabled = true },
  input = { enabled = true },
  lazygit = { enabled = true },
  notifier = { enabled = true },
  picker = { enabled = true },
  rename = { enabled = true },
  quickfile = { enabled = true },
  scope = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },
}

local km = vim.keymap.set

-- ------------------------------------------------------------
-- Find
-- ------------------------------------------------------------
km(
  'n',
  '<leader>ff',
  "<cmd>lua require('snacks').picker.files()<cr>",
  { desc = 'Find Files', remap = true }
)
km(
  'n',
  '<leader>fb',
  "<cmd>lua require('snacks').picker.buffers()<cr>",
  { desc = 'Find Buffers', noremap = true }
)
km(
  'n',
  '<leader>ff',
  "<cmd>lua require('snacks').picker.files()<cr>",
  { desc = 'Find Files (root dir)', noremap = true }
)
km(
  'n',
  '<leader>fR',
  "<cmd>lua require('snacks').picker.resume()<cr>",
  { desc = 'Resume prev search', noremap = true }
)
km(
  { 'n', 'x' },
  '<leader>fw',
  "<cmd>lua require('snacks').picker.grep_word()<cr>",
  { desc = 'Find Word Under Cursor', noremap = true }
)
km(
  'n',
  '<leader>lg',
  "<cmd>lua require('snacks').picker.grep()<cr>",
  { desc = 'Live grep project', noremap = true }
)
km(
  'n',
  '<leader>lb',
  "<cmd>lua require('snacks').picker.lines()<cr>",
  { desc = 'Live grep current buffer', noremap = true }
)

-- ------------------------------------------------------------
-- LSP
-- ------------------------------------------------------------
km(
  'n',
  '<leader>fr',
  "<cmd>lua require('snacks').picker.lsp_references()<cr>",
  { desc = 'Find LSP Reference', noremap = true }
)
km(
  'n',
  'gd',
  "<cmd>lua require('snacks').picker.lsp_definitions()<cr>",
  { desc = 'Show LSP definitions', noremap = true }
)
km(
  'n',
  '<leader>ds',
  "<cmd>lua require('snacks').picker.lsp_symbols()<cr>",
  { desc = 'Show LSP document symbols', noremap = true }
)

-- ------------------------------------------------------------
-- Misc
-- ------------------------------------------------------------
km(
  'n',
  '<leader>ss',
  "<cmd>lua require('snacks').picker.spelling()<cr>",
  { desc = 'Spelling Suggestions', noremap = true }
)
