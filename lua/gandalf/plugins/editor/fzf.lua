local M = {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    -- ------------------------------------------------------------
    -- Find
    -- ------------------------------------------------------------
    { '<leader>fb', '<cmd>FzfLua buffers<cr>', desc = 'Find Buffers' },
    { '<leader>ff', '<cmd>FzfLua files<cr>', desc = 'Find Files (root dir)' },
    { '<leader>fr', '<cmd>FzfLua oldfiles<cr>', desc = 'Find Old Files' },
    { '<leader>fR', '<cmd>FzfLua resume<cr>', desc = 'Resume prev search' },
    { '<leader>ft', '<cmd>FzfLua tabs<cr>', desc = 'Find Tabs' },
    { '<leader>fw', '<cmd>FzfLua grep_cword<cr>', desc = 'Find Word Under Cursor' },
    { '<leader>fW', '<cmd>FzfLua grep_cWORD<cr>', desc = 'Find WORD Under Cursor' },
    { '<leader>lg', '<cmd>FzfLua live_grep<cr>', desc = 'Live grep project' },
    { '<leader>lb', '<cmd>FzfLua lgrep_curbuf<cr>', desc = 'Live grep current buffer' },

    -- ------------------------------------------------------------
    -- Misc
    -- ------------------------------------------------------------
    { '<leader>ss', '<cmd>FzfLua spell_suggest<cr>', desc = 'Spelling Suggestions' },
    { '<leader>ch', '<cmd>FzfLua command_history<cr>', desc = 'Spelling Suggestions' },
  },
  config = function()
    -- calling `setup` is optional for customization
    require('fzf-lua').setup {}
  end,
}

return M
