vim.pack.add {
  "https://github.com/MeanderingProgrammer/render-markdown.nvim",
  "https://github.com/RRethy/vim-illuminate",
  "https://github.com/rktjmp/lush.nvim", -- dependency for artic.nvim
  {src="https://github.com/rockyzhang24/arctic.nvim", version="v2"},
  "https://github.com/nanozuki/tabby.nvim",
  "https://github.com/levouh/tint.nvim",
  'https://github.com/nvim-tree/nvim-web-devicons',
  "https://github.com/nvim-lualine/lualine.nvim",
  'https://github.com/nvim-lua/plenary.nvim', -- dependency of refactoring.nvim
  'https://github.com/nvim-treesitter/nvim-treesitter', -- dependency of refactoring.nvim
  'https://github.com/ThePrimeagen/refactoring.nvim',
  'https://github.com/hiphish/rainbow-delimiters.nvim',
  'https://github.com/hiphish/rainbow-delimiters.nvim',
}


require("render-markdown").setup()
require("illuminate").configure {
  delay = 200,
  large_file_cutoff = 2000,
  large_file_overrides = {
    providers = { 'lsp' },
  },
}
require('tabby').setup()
require('tabby.tabline').use_preset('active_wins_at_tail', { buf_name = { mode = 'shorten' } })
require("tint").setup {tint = -50, saturation = 0.8}
local line = require("lualine").setup {
  sections = { lualine_c = { 'filename', 'aerial' } },
}
require('refactoring').setup()
require('rainbow-delimiters.setup').setup {}

local function map(key, dir, buffer)
  vim.keymap.set('n', key, function()
    require('illuminate')['goto_' .. dir .. '_reference'](false)
  end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. ' Reference', buffer = buffer })
end

map(']]', 'next')
map('[[', 'prev')
-- also set it after loading ftplugins, since a lot overwrite [[ and ]]
vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    local buffer = vim.api.nvim_get_current_buf()
    map(']]', 'next', buffer)
    map('[[', 'prev', buffer)
  end,
})

vim.cmd 'colorscheme arctic'
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#54575c' })
