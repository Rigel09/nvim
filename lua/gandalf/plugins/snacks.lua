local M = {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  keys = {
    { '<leader>lt', '<cmd>lua require("snacks").lazygit.open()<cr>', desc = 'LazyGit' },

    -- ------------------------------------------------------------
    -- Find
    -- ------------------------------------------------------------
    {
      '<leader>fb',
      function()
        require('snacks').picker.buffers()
      end,
      desc = 'Find Buffers',
    },
    {
      '<leader>ff',
      function()
        require('snacks').picker.files()
      end,
      desc = 'Find Files (root dir)',
    },
    -- { '<leader>fo', function() require('snacks').picker. end, desc = 'Find Old Files' },
    {
      '<leader>fR',
      function()
        require('snacks').picker.resume()
      end,
      desc = 'Resume prev search',
    },
    {
      '<leader>fw',
      function()
        require('snacks').picker.grep_word()
      end,
      desc = 'Find Word Under Cursor',
      mode = { 'n', 'x' },
    },
    {
      '<leader>lg',
      function()
        require('snacks').picker.grep()
      end,
      desc = 'Live grep project',
    },
    {
      '<leader>lb',
      function()
        require('snacks').picker.lines()
      end,
      desc = 'Live grep current buffer',
    },

    -- ------------------------------------------------------------
    -- LSP
    -- ------------------------------------------------------------
    {
      '<leader>fr',
      function()
        require('snacks').picker.lsp_references()
      end,
      desc = 'Find LSP Reference',
    },
    {
      'gd',
      function()
        require('snacks').picker.lsp_definitions()
      end,
      desc = 'Show LSP definitions',
    },
    {
      '<leader>ds',
      function()
        require('snacks').picker.lsp_symbols()
      end,
      desc = 'Show LSP document symbols',
    },

    -- ------------------------------------------------------------
    -- Misc
    -- ------------------------------------------------------------
    {
      '<leader>ss',
      function()
        require('snacks').picker.spelling()
      end,
      desc = 'Spelling Suggestions',
    },
  },
  config = function()
    local snacks = require 'snacks'
    snacks.setup {
      bigfile = { enabled = true },
      bufdelete = { enabled = true },
      dashboard = { enabled = true },
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

    local prev = { new_name = '', old_name = '' } -- Prevents duplicate events
    vim.api.nvim_create_autocmd('User', {
      pattern = 'NvimTreeSetup',
      callback = function()
        local events = require('nvim-tree.api').events
        events.subscribe(events.Event.NodeRenamed, function(data)
          if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
            data = data
            snacks.rename.on_rename_file(data.old_name, data.new_name)
          end
        end)
      end,
    })
  end,
}

return M
