local M = {
  'kdheepak/lazygit.nvim',
  lazy = true,
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  -- optional for floating window border decoration
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time

  config = function()
    require('telescope').load_extension 'lazygit'

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
      pattern = '*',
      command = "lua require('lazygit.utils').project_root_dir()",
    })
  end,
  keys = {
    { '<leader>lt', '<cmd>LazyGitCurrentFile<cr>', desc = 'LazyGit' },
  },
}

return M
