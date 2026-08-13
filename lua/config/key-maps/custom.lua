--- Grabs the current line under the cursor and swaps true to false and vise
--- versa. Only to be operated in normal mode
local swapBoolean = function()
  ---@type string
  local cur_line = ''

  local mode = vim.fn.mode()
  if mode == 'n' then
    cur_line = vim.api.nvim_get_current_line()
  elseif mode == 'V' or mode == '^V' then
    -- This may be helpful for this
    -- https://github.com/saidelike/cursorless/pull/9/files
    -- local start, stop =
    --   vim.fn.getregionpos(vim.fn.getpos 'v', vim.fn.getpos '.')
    -- vim.print('start: ' .. vim.inspect(start))
    vim.notify 'Cant use in visual mode yet'
    return
  end

  local replace_lut = {
    on = 'off',
    On = 'Off',
    ON = 'OFF',
    True = 'False',
    TRUE = 'FALSE',
    enabled = 'disabled',
    Enabled = 'Disabled',
    ENABLED = 'DISABLED',
    yes = 'no',
    Yes = 'No',
    YES = 'NO',
    active = 'inactive',
    Active = 'Inactive',
    ACTIVE = 'INACTIVE',
    low = 'high',
    Low = 'High',
    LOW = 'HIGH',
  }
  replace_lut['true'] = 'false'
  replace_lut['0'] = '1'

  local temp_lut = replace_lut
  for x, y in pairs(temp_lut) do
    replace_lut[y] = x
  end

  ---@type string
  local regex_str = '\\v<('
  ---@type boolean
  local first = true
  for x, y in pairs(replace_lut) do
    if not first then
      regex_str = regex_str .. '|'
    end
    regex_str = regex_str .. x
    first = false
  end

  regex_str = regex_str .. ')>'

  vim.print(regex_str)

  local regex = vim.regex(regex_str)
  local start, stop = regex:match_str(cur_line)

  if start and stop then
    local val = string.sub(cur_line, start + 1, stop)
    local new_val = replace_lut[val]

    if new_val then
      local new_line = string.sub(cur_line, 0, start)
        .. new_val
        .. string.sub(cur_line, stop + 1)
      vim.api.nvim_set_current_line(new_line)
    else
      vim.notify('Failed to find replacement for ' .. val)
    end
  else
    vim.notify 'Replacement REGEX failed to match'
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
  { 'n', 'v' },
  '<leader>af',
  swapBoolean,
  { desc = 'Swap Boolean', remap = true }
)
