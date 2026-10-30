local insert_header_guard = function()
  local hpp_path = vim.fn.expand '%:p'

  local file_path_parts = {}
  for seg in string.gmatch(hpp_path, '[^/]+') do
    table.insert(file_path_parts, seg)
  end

  if hpp_path:find('.hpp', 1, true) then
    local file_name = file_path_parts[#file_path_parts]
    file_name = file_name:gsub('%.', '_')
    local namespace = file_path_parts[#file_path_parts - 1]

    local guard = string.upper(namespace) .. '_' .. string.upper(file_name)
    local header_guard_1 = '#ifndef ' .. guard
    local header_guard_2 = '#define ' .. guard
    local guard_termination = '#endif // ' .. guard
    vim.api.nvim_buf_set_lines(0, 0, 0, false, { header_guard_1 })
    vim.api.nvim_buf_set_lines(0, 1, 1, false, { header_guard_2 })
    vim.api.nvim_buf_set_lines(0, -1, -1, false, { guard_termination })
  end
end

vim.keymap.set(
  { 'n', 'v' },
  '<leader>cf',
  insert_header_guard,
  { desc = 'Create CPP Header Guard', remap = true }
)
