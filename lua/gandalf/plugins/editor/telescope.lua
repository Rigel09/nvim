local M = {
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    -- ------------------------------------------------------------
    -- find
    -- ------------------------------------------------------------
    -- { '<leader>fb', '<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>', desc = 'Find Buffers' },
    -- { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files (root dir)' },
    -- { '<leader>fo', '<cmd>Telescope oldfiles<cr>', desc = 'Recent' },
    -- { '<leader>fR', '<cmd>Telescope resume<cr>', desc = 'Resume Search' },
    -- { '<leader>fw', '<cmd>Telescope grep_string<cr>', desc = 'Find word' },
    -- { '<leader>lg', '<cmd>Telescope live_grep<cr>', desc = 'Grep (cwd)' },

    -- ------------------------------------------------------------
    -- LSP
    -- ------------------------------------------------------------
    -- { '<leader>fr', '<cmd>Telescope lsp_references<cr>', desc = 'Find LSP Reference' },

    -- ------------------------------------------------------------
    -- search
    -- ------------------------------------------------------------
    -- { '<leader>s"', '<cmd>Telescope registers<cr>', desc = 'Find Registers' },
    -- { '<leader>ch', '<cmd>Telescope command_history<cr>', desc = 'Command History' },
  },
}
return M
