local M = {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-buffer', -- source for text in buffer
    'hrsh7th/cmp-path', -- source for file system paths
    'hrsh7th/cmp-nvim-lsp-signature-help', -- source for file system paths
    'L3MON4D3/LuaSnip', -- snippet engine
    'saadparwaiz1/cmp_luasnip', -- for autocompletion
    'onsails/lspkind.nvim', -- vs-code like pictograms
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    local lspkind = require 'lspkind'

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    -- require('luasnip.loaders.from_vscode').lazy_load()

    cmp.setup {
      window = {
        completion = { -- rounded border; thin-style scrollbar
          border = 'rounded',
          scrollbar = '║',
        },
        documentation = { -- no border; native-style scrollbar
          border = 'rounded',
          scrollbar = '║',
          -- other options
        },
      },
      completion = {
        completeopt = 'menu,menuone,preview,noselect',
      },
      -- snippet = { -- configure how nvim-cmp interacts with snippet engine
      --   expand = function(args)
      --     luasnip.lsp_expand(args.body)
      --   end,
      -- },
      mapping = cmp.mapping.preset.insert {
        ['<C-k>'] = cmp.mapping.select_prev_item(), -- previous suggestion
        ['<C-j>'] = cmp.mapping.select_next_item(), -- next suggestion
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-S>'] = cmp.mapping.complete(), -- show completion suggestions
        ['<C-e>'] = cmp.mapping.abort(), -- close completion window
        ['<CR>'] = cmp.mapping.confirm { select = false },
      },
      -- sources for autocompletion
      sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- snippets
        { name = 'buffer' }, -- text within current buffer
        { name = 'path' }, -- file system paths
        { name = 'nvim_lsp_signature_help' },
        { name = 'crates' },
      },
      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format {
          maxwidth = 50,
          ellipsis_char = '...',
        },
      },
    }
    vim.api.nvim_create_autocmd({ 'CursorHoldI', 'TextChangedI' }, {
      group = vim.api.nvim_create_augroup('cmp_complete_on_space', {}),
      callback = function()
        local line = vim.api.nvim_get_current_line()
        local cursor = vim.api.nvim_win_get_cursor(0)[2]

        if string.sub(line, cursor, cursor + 1) == ' ' then
          require('cmp').complete()
        end
      end,
    })
  end,
}

return M
