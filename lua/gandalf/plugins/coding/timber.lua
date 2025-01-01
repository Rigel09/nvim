local M = {
  'Goose97/timber.nvim',
  version = '*', -- Use for stabilty; omit to use `main` branch for the latest features
  event = 'VeryLazy',
  keys = {
    {
      '<leader>glc',
      function()
        require('timber.actions').clear_log_statements { global = false }
      end,
      desc = 'Timber: Clear log statements',
    },
    {
      '<leader>glt',
      function()
        require('timber.actions').toggle_comment_log_statements { global = false }
      end,
      desc = 'Timber: Toggle comments',
    },
  },
  config = function()
    require('timber').setup {
      log_templates = {
        default = {
          python = [[print(f"%log_marker %filename:%line_number - %log_target: {%log_target}")]],
          cpp = [[std::cout << "%log_marker %filename:%line_number - %log_target: " << %log_target << std::endl;]],
        },
      },
      log_marker = 'JLOG',
    }
  end,
}

return M
