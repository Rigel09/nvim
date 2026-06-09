vim.pack.add {
  'https://github.com/williamboman/mason-lspconfig.nvim',
  'https://github.com/williamboman/mason.nvim',
  'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
  'https://github.com/folke/trouble.nvim',
}

-- import mason
local mason = require 'mason'

-- import mason-lspconfig
local mason_lspconfig = require 'mason-lspconfig'

local mason_tool_installer = require 'mason-tool-installer'

-- enable mason and configure icons
mason.setup {
  ui = {
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗',
    },
  },
}

mason_lspconfig.setup {
  -- list of servers for mason to install
  ensure_installed = {
    'bashls', --bash

    'lua_ls', --lua

    'matlab_ls', --matlab

    'jedi_language_server', --python
    'basedpyright', --python
    'pylsp', -- python
    'pyright', -- python
    'basedpyright', -- python

    'rust_analyzer', -- rust

    'clangd', -- c++

    'yamlls', -- yaml
  },
  -- auto-install configured servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed
  automatic_enable = false,
}

mason_tool_installer.setup {
  ensure_installed = {
    'shellcheck', -- bash linter / formatter

    'cmakelang',
    'cmakelint',
    -- 'cmake-language-server',

    'docker_compose_language_service',
    'dockerls',

    'hadolint',
    'prettier', -- prettier formatter
    'stylua', -- lua formatter

    'isort', -- python formatter
    'black', -- python formatter
    'pylint', -- python linter
    'ruff', --python
    'mypy', --python

    'codelldb', --rust

    'yamlfmt', -- yaml
    'yamlfix', -- yaml
    'yamllint', -- yaml
  },
}

local km = vim.keymap.set
km(
  'n',
  '<leader>xx',
  '<cmd>Trouble diagnostics toggle<cr>',
  { desc = 'Diagnostics (Trouble)' }
)
km(
  'n',
  '<leader>xX',
  '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
  { desc = 'Buffer Diagnostics (Trouble)' }
)
km(
  'n',
  '<leader>cs',
  '<cmd>Trouble symbols toggle focus=false<cr>',
  { desc = 'Symbols (Trouble)' }
)
km(
  'n',
  '<leader>cl',
  '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
  { desc = 'LSP Definitions / references / ... (Trouble)' }
)
km(
  'n',
  '<leader>xL',
  '<cmd>Trouble loclist toggle<cr>',
  { desc = 'Location List (Trouble)' }
)
km(
  'n',
  '<leader>xQ',
  '<cmd>Trouble qflist toggle<cr>',
  { desc = 'Quickfix List (Trouble)' }
)
