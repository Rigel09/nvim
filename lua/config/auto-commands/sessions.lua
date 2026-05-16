-- Automatically load a session file if it exists
local auto_save_session_cb = function()
  require 'notify' 'Saving Session'

  if vim.fn.isdirectory '.nvim' == 0 then
    vim.fn.mkdir '.nvim'
  end

  vim.api.nvim_command 'mksession! .nvim/Session.vim'
end

-- vim.api.nvim_create_autocmd('ExitPre', {
--   callback = auto_save_session_cb,
-- })
