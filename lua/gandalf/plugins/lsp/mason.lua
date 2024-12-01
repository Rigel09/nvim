local M = {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
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
        -- bash
        -- ********************************
        'bashls', --bash

        -- lua
        -- ********************************
        'lua_ls', --lua

        -- matlab
        -- ********************************
        'matlab_ls',

        -- python
        -- ********************************
        -- 'jedi_language_server', --python
        'pylsp', --python
        -- 'pyright', --python

        -- rust
        -- ********************************
        -- 'codelldb', --rust
        'rust_analyzer', --rust

        'clangd',

        'yamlls',
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    }

    mason_tool_installer.setup {
      ensure_installed = {
        'cmakelang',
        'cmakelint',
        'cmake-language-server',
        'docker_compose_language_service',
        'dockerls',
        'hadolint',
        'prettier', -- prettier formatter
        'stylua', -- lua formatter
        'isort', -- python formatter
        'black', -- python formatter
        'pylint', -- python linter
        'shellcheck', -- bash linter / formatter
        'mypy', --python
        'yamlfmt',
        'yamlfix',
        'yamllint',
      },
    }
  end,
}

return M
