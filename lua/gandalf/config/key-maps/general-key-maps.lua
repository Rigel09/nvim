local km = vim.keymap.set

--- TODO Figure out what this one does
---  It doesn't work
--- km("n", "<leader><leader>", ":")
--- This will allow the correct number of lines to be
--- moved up or down if lines so happen to be wrapped
--- which I have turned off

km({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
km({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- vim-tmux-navigator
-- Add an else to this statement to do like normal without tmux
if os.getenv 'TMUX' then
  km('n', '<C-h>', '<cmd>TmuxNavigateLeft<cr>', { desc = 'Go left a window', remap = true })
  km('n', '<C-j>', '<cmd>TmuxNavigateDown<cr>', { desc = 'Go down a window', remap = true })
  km('n', '<C-k>', '<cmd>TmuxNavigateUp<cr>', { desc = 'Go up a window', remap = true })
  km('n', '<C-l>', '<cmd>TmuxNavigateRight<cr>', { desc = 'Go right a window', remap = true })
else
  km('n', '<C-j>', '<C-w>j', { desc = 'Go down a window', remap = true })
  km('n', '<C-h>', '<C-w>h', { desc = 'Go left a window', remap = true })
  km('n', '<C-k>', '<C-w>k', { desc = 'Go up a  window', remap = true })
  km('n', '<C-l>', '<C-w>l', { desc = 'Go right a window', remap = true })
end

-- Move Lines
km('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move down' })
km('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move up' })
km('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move down' })
km('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move up' })
km('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move down' })
km('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move up' })

-- Swap buffers more easily
km('n', '<S-j>', '<cmd>bprevious<cr>', { desc = 'Prev buffer' })
km('n', '<S-k>', '<cmd>bnext<cr>', { desc = 'Next buffer' })
km('n', '[b', '<cmd>bprevious<cr>', { desc = 'Prev buffer' })
km('n', ']b', '<cmd>bnext<cr>', { desc = 'Next buffer' })

-- Work with tabs
km('n', '[t', '<cmd>tabp<cr>', { desc = 'Go to previous tab' })
km('n', ']t', '<cmd>tabn<cr>', { desc = 'Go to next tab' })
km('n', '<leader>tn', '<cmd>tabnew<cr>', { desc = 'Create new tab' })
km('n', '<leader>tc', '<cmd>tabclose<cr>', { desc = 'Close current tab' })
km('n', '<leader>to', '<cmd>tabonly<cr>', { desc = 'Close all other tabs' })
km('n', '<leader>tmp', '<cmd>-tabmove<cr>', { desc = 'Move tab previous' })
km('n', '<leader>tmn', '<cmd>+tabmove<cr>', { desc = 'Move tab next' })

-- save file
km({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })

-- lazy
km('n', '<leader>ll', '<cmd>Lazy<cr>', { desc = 'Lazy' })

-- Quit All
km('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quite all', noremap = true })

-- Misc
km('n', '<leader>cc', '<cmd>noh<cr>', { desc = 'Runs noh', noremap = true })
km('n', '<leader>fP', '<cmd>echo expand("%:p")<cr>', { desc = 'Prints abs path to file in active buffer.', noremap = true })
km('i', '<C-l>', '<Del>', { desc = 'Delete Key in insert', noremap = true })
km('n', '<leader>ih', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { 0 }, { 0 })
end)
