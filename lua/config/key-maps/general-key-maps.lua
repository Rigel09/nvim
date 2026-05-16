local km = vim.keymap.set

km({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
km({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Move Lines
km('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move down', noremap = true })
km('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move up', noremap = true })
km('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move down', noremap = true })
km('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move up', noremap = true })
km('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move down', noremap = true })
km('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move up', noremap = true })

-- Work with tabs
km('n', '[t', '<cmd>tabp<cr>', { desc = 'Go to previous tab', noremap = true })
km('n', ']t', '<cmd>tabn<cr>', { desc = 'Go to next tab', noremap = true })
km('n', '<leader>tn', '<cmd>tabnew<cr>', { desc = 'Create new tab', noremap = true })
km('n', '<leader>tc', '<cmd>tabclose<cr>', { desc = 'Close current tab', noremap = true })
km('n', '<leader>to', '<cmd>tabonly<cr>', { desc = 'Close all other tabs', noremap = true })
km('n', '<leader>tmp', '<cmd>-tabmove<cr>', { desc = 'Move tab previous', noremap = true })
km('n', '<leader>tmn', '<cmd>+tabmove<cr>', { desc = 'Move tab next', noremap = true })

km({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file', noremap = true })

km('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quite all', noremap = true })

-- Misc
km('n', '<leader>fP', '<cmd>echo expand("%:p")<cr>', { desc = 'Prints abs path to file in active buffer.', noremap = true })
km('i', '<C-h>', '<del>', { desc = 'Backspace Key in insert. (Delete previous character)' })
km('i', '<C-l>', '<del>', { desc = 'Fowardspace Key in insert. (Delete next character)', remap = true })
