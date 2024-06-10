local km = vim.keymap.set
local session_file = '.nvim/Session.vim'

local reload_saved_session = function()
  local notify = require 'notify'

  if vim.fn.filereadable(session_file) ~= 0 then
    vim.cmd('source ' .. session_file)
    notify('Loaded session from ' .. session_file)
  else
    notify('Session File [' .. session_file .. "] doesn't exist")
  end
end

km({ 'n' }, '<leader>ls', reload_saved_session, { desc = 'Reload saved Session', remap = true })
