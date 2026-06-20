--- Grabs the current line under the cursor and swaps true to false and vise
--- versa. Only to be operated in normal mode
local swapBoolean = function()
  ---@type string
  local cur_line = ''

  local mode = vim.fn.mode()
  vim.notify('mode is ' .. mode)
  if mode == 'n' then
    cur_line = vim.api.nvim_get_current_line()
  elseif mode == 'V' or mode == '^V' then
    cur_line = vim.fn.getregionpos(vim.fn.getpos 'v', vim.fn.getpos '.')
    vim.notify('current line is ' .. cur_line)
  end

  local true_regex = vim.regex '.*\\s\\(true\\)\\|\\(True\\)\\|\\(TRUE\\).*'
  local contains_true = true_regex:match_str(cur_line)

  local false_regex = vim.regex '.*\\s\\(false\\)\\|\\(False\\)\\|\\(FALSE\\).*'
  local contains_false = false_regex:match_str(cur_line)

  if contains_true and contains_false then
    vim.notify 'Found both true and false, replace not completed'
  elseif contains_true then
    local new_line = string.gsub(cur_line, 'true', 'false')
    new_line = string.gsub(new_line, 'True', 'False')
    new_line = string.gsub(new_line, 'TRUE', 'FALSE')
    vim.api.nvim_set_current_line(new_line)
  elseif contains_false then
    local new_line = string.gsub(cur_line, 'false', 'true')
    new_line = string.gsub(new_line, 'False', 'True')
    new_line = string.gsub(new_line, 'FALSE', 'TRUE')
    vim.api.nvim_set_current_line(new_line)
  end
end

vim.keymap.set(
  { 'n' },
  '<leader>af',
  swapBoolean,
  { desc = 'Swap Boolean', remap = true }
)
