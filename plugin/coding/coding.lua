vim.pack.add {
  'https://github.com/numToStr/Comment.nvim',
  'https://github.com/echasnovski/mini.pairs',
  'https://github.com/rmagatti/goto-preview',
  'https://github.com/kylechui/nvim-surround',
  'https://github.com/nvim-tree/nvim-web-devicons', --render-markdown dependency
  'https://github.com/nvim-treesitter/nvim-treesitter', -- render-markdown & neogen dependency
  'https://github.com/linux-cultist/venv-selector.nvim',
  'https://github.com/RRethy/vim-illuminate',
  'https://github.com/sindrets/diffview.nvim',
  'https://github.com/danymat/neogen',
  'https://github.com/p00f/clangd_extensions.nvim',
  'https://github.com/roobert/f-string-toggle.nvim',
  'https://github.com/mrcjkb/rustaceanvim',
  'https://github.com/nvim-treesitter/nvim-treesitter-context',
  {
    src = 'https://github.com/nvim-treesitter/nvim-treesitter',
    version = 'main',
  },
  { src = 'https://github.com/saghen/blink.cmp', version = 'v1' },
  'https://github.com/L3MON4D3/LuaSnip',
  'https://github.com/rafamadriz/friendly-snippets',
}

require('Comment').setup()
require('mini.pairs').setup()
require('goto-preview').setup()
require('nvim-surround').setup()
require('venv-selector').setup {
  fd_binary_name = 'fdfind',
  picker = 'snacks',
}
require('diffview').setup()
require('neogen').setup()
require('f-string-toggle').setup {
  key_binding = '<leader>sf',
  key_binding_desc = 'Toggle f-string',
}
require('treesitter-context').setup { mode = 'cursor', max_lines = 5 }
require('nvim-treesitter').setup()
require('nvim-treesitter').install {
  'bash',
  'c',
  'cmake',
  'cpp',
  'diff',
  'dockerfile',
  'html',
  'javascript',
  'jsdoc',
  'json',
  'jsonc',
  'lua',
  'luadoc',
  'luap',
  'markdown',
  'markdown_inline',
  'matlab',
  'python',
  'qmljs',
  'qmldir',
  'query',
  'regex',
  'ron',
  'rust',
  'toml',
  'tsx',
  'typescript',
  'vim',
  'vimdoc',
  'yaml',
  'zig',
}
require('blink.cmp').setup {
  snippets = { preset = 'luasnip' },
  signature = { enabled = true, window = { border = 'single' } },
  keymap = {
    preset = 'enter',
    ['<C-j>'] = { 'select_next', 'fallback' },
    ['<C-k>'] = { 'select_prev', 'fallback' },
  },

  appearance = {
    -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- Adjusts spacing to ensure icons are aligned
    nerd_font_variant = 'mono',
  },

  -- (Default) Only show the documentation popup when manually triggered
  completion = {
    documentation = { auto_show = true, window = { border = 'single' } },
    menu = { border = 'single' },
    ghost_text = { enabled = true },
  },

  -- Default list of enabled providers defined so that you can extend it
  -- elsewhere in your config, without redefining it, due to `opts_extend`
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },

  -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
  -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
  -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
  --
  -- See the fuzzy documentation for more information
  fuzzy = {
    implementation = 'prefer_rust_with_warning',
    sorts = { 'exact', 'score', 'sort_text' },
  },
}

local km = vim.keymap.set
km(
  'n',
  '<leader>gpd',
  '<cmd>lua require("goto-preview").goto_preview_definition()<CR>',
  { desc = 'Goto preview definition' }
)
km(
  'n',
  '<leader>gpt',
  '<cmd>lua require("goto-preview").goto_preview_type_definition()<CR>',
  { desc = 'Goto preview type definition' }
)
km(
  'n',
  '<leader>gpi',
  '<cmd>lua require("goto-preview").goto_preview_implementation()<CR>',
  { desc = 'Goto preview implementation' }
)
km(
  'n',
  '<leader>gpD',
  '<cmd>lua require("goto-preview").goto_preview_declaration()<CR>',
  { desc = 'Goto preview declaration' }
)
km(
  'n',
  '<leader>gP',
  '<cmd>lua require("goto-preview").close_all_win()<CR>',
  { desc = 'Close all GOTO Windows' }
)
km(
  'n',
  '<leader>gpr',
  '<cmd>lua require("goto-preview").goto_preview_references()<CR>',
  { desc = 'Goto preview references' }
)
km(
  'n',
  '<leader>vs',
  '<cmd>VenvSelect<cr>',
  { desc = 'Select a python venv', noremap = true }
)
km('n', '<leader>dvo', '<cmd>DiffviewOpen<cr>', { desc = 'Opens Diff View' })
km('n', '<leader>dvc', '<cmd>DiffviewClose<cr>', { desc = 'Opens Diff View' })
km(
  'n',
  '<leader>nf',
  "<cmd>lua require('neogen').generate {}<CR>",
  { desc = 'Creates a docstring fro a function' }
)
km(
  'n',
  '<leader>nc',
  "<cmd>lua require('neogen').generate { type = 'class' }<CR>",
  { desc = 'Creates a docstring for a class' }
)

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'cpp', 'yaml', 'python', 'rust', 'json', 'zig' },
  callback = function()
    vim.treesitter.start()
  end,
})
