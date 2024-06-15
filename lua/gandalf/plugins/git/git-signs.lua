local git_signs_on_attach = function(bufnr)
  local gitsigns = require 'gitsigns'

  local function km(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = bufnr
    vim.keymap.set(mode, l, r, opts)
  end

  -- Navigation
  km('n', ']c', function()
    if vim.wo.diff then
      vim.cmd.normal { ']c', bang = true }
    else
      gitsigns.next_hunk()
    end
  end, { desc = 'Git - Next Hunk' })

  km('n', '[c', function()
    if vim.wo.diff then
      vim.cmd.normal { '[c', bang = true }
    else
      gitsigns.prev_hunk()
    end
  end, { desc = 'Git - Prev Hunk' })

  -- Actions
  km('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Git - Stage Hunk' })
  km('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Git - Reset Hunk' })

  km('v', '<leader>hs', function()
    gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
  end, { desc = 'Git - Stage Hunk' })

  km('v', '<leader>hr', function()
    gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
  end, { desc = 'Git - Reset Hunk' })

  km('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'Git - Stage Buffer' })
  km('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = 'Git - Undo Stage Hunk' })
  km('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'Git - Reset Buffer' })
  km('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Git - Preview Hunk' })

  km('n', '<leader>hb', function()
    gitsigns.blame_line { full = true }
  end, { desc = 'Git - Blame Line' })

  km('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'Git - Toggle Current Line Blame' })
  km('n', '<leader>hd', gitsigns.diffthis, { desc = 'Git - Diff This' })

  km('n', '<leader>hD', function()
    gitsigns.diffthis '~'
  end, { desc = 'Git - Diff This' })

  km('n', '<leader>td', gitsigns.toggle_deleted, { desc = 'Git - Toggle Deleted' })

  -- Text object
  km({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Git - Select Hunk' })
end

local M = {
  'lewis6991/gitsigns.nvim',
  -- config = true,
  config = function()
    require('gitsigns').setup { on_attach = git_signs_on_attach }
  end,
}

return M
