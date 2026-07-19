--- Grabs the current line under the cursor and swaps true to false and vise
--- versa. Only to be operated in normal mode
local swapBoolean = function()
  ---@type string
  local cur_line = ''

  local mode = vim.fn.mode()
  if mode == 'n' then
    cur_line = vim.api.nvim_get_current_line()
  elseif mode == 'V' or mode == '^V' then
    cur_line = vim.fn.getregionpos(vim.fn.getpos 'v', vim.fn.getpos '.')
  end

  local true_regex = vim.regex '.*\\(true\\)\\|\\(True\\)\\|\\(TRUE\\).*'
  local contains_true = true_regex:match_str(cur_line)

  local false_regex = vim.regex '.*\\(false\\)\\|\\(False\\)\\|\\(FALSE\\).*'
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

local swapCppIncludeBrackets = function()
  ---@type string
  local cur_line = ''

  local mode = vim.fn.mode()
  if mode == 'n' then
    cur_line = vim.api.nvim_get_current_line()
  elseif mode == 'V' or mode == '^V' then
    cur_line = vim.fn.getregionpos(vim.fn.getpos 'v', vim.fn.getpos '.')
  end

  local quote_regex = vim.regex '".*"'
  local contains_quotes = quote_regex:match_str(cur_line)

  local bracket_regex = vim.regex '<.*>'
  local contains_bracket = bracket_regex:match_str(cur_line)

  if contains_quotes and contains_bracket then
    vim.notify 'Found both brackets and quotes, replace not completed'
  elseif contains_bracket then
    local new_line = string.gsub(cur_line, '<(.*)>', '"%1"')
    vim.api.nvim_set_current_line(new_line)
  elseif contains_quotes then
    local new_line = string.gsub(cur_line, '"(.*)"', '<%1>')
    vim.api.nvim_set_current_line(new_line)
  end
end

vim.keymap.set(
  { 'n' },
  '<leader>sb',
  swapCppIncludeBrackets,
  { desc = 'Swap CPP include styles "" -> <> and vise versa' }
)

vim.keymap.set(
  { 'n' },
  '<leader>af',
  swapBoolean,
  { desc = 'Swap Boolean', remap = true }
)
