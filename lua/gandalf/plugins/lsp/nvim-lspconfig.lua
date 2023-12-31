local M = {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    -- { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
    { 'antosha417/nvim-lsp-file-operations', config = true },
    'folke/neodev.nvim',
  },
  config = function()
    local function has(plugin)
      return require('lazy.core.config').spec.plugins[plugin] ~= nil
    end

    if has 'neoconf.nvim' then
      local plugin = require('lazy.core.config').spec.plugins['neoconf.nvim']
      require('neoconf').setup(require('lazy.core.plugin').values(plugin, 'opts', false))
    end
    require('neoconf').setup {}

    require('neodev').setup()

    -- import lspconfig plugin
    local lspconfig = require 'lspconfig'

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require 'cmp_nvim_lsp'

    local keymap = vim.keymap -- for conciseness

    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr
      -- client.resolved_capabilities.hover = true

      -- set keybinds
      opts.desc = 'Show LSP references'
      keymap.set('n', 'gR', '<cmd>Telescope lsp_references<CR>', opts) -- show definition, references

      opts.desc = 'Go to declaration'
      keymap.set('n', 'gD', vim.lsp.buf.declaration, opts) -- go to declaration

      opts.desc = 'Show LSP definitions'
      keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts) -- show lsp definitions

      opts.desc = 'Show LSP implementations'
      keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts) -- show lsp implementations

      opts.desc = 'Show LSP type definitions'
      keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts) -- show lsp type definitions

      opts.desc = 'See available code actions'
      keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

      opts.desc = 'Smart rename'
      keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts) -- smart rename

      opts.desc = 'Show buffer diagnostics'
      keymap.set('n', '<leader>D', '<cmd>Telescope diagnostics bufnr=0<CR>', opts) -- show  diagnostics for file

      opts.desc = 'Show line diagnostics'
      keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts) -- show diagnostics for line

      opts.desc = 'Go to previous diagnostic'
      keymap.set('n', '[d', vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

      opts.desc = 'Go to next diagnostic'
      keymap.set('n', ']d', vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

      opts.desc = 'Show documentation for what is under cursor'
      keymap.set('n', 'K', vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

      opts.desc = 'Show signature for what is under cursor'
      keymap.set('n', 'S', vim.lsp.buf.signature_help, opts) -- show signature for what is under cursor

      opts.desc = 'Restart LSP'
      keymap.set('n', '<leader>rs', ':LspRestart<CR>', opts) -- mapping to restart lsp if necessary
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end

    -- configure html server
    lspconfig['html'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }
    -- configure python server
    lspconfig['pylsp'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }
    lspconfig['clangd'].setup {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        require('clangd_extensions.inlay_hints').setup_autocmd()
        require('clangd_extensions.inlay_hints').set_inlay_hints()
      end,
    }
    lspconfig['bashls'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { 'tmux' },
    }
    lspconfig['matlab_ls'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }
    -- configure rust server
    lspconfig['rust_analyzer'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { 'rust' },
      root_dir = require('lspconfig.util').root_pattern 'Cargo.toml',
      settings = {
        ['rust_analyzer'] = {
          checkOnSave = {
            enable = true,
            command = 'clippy',
          },
          cargo = { allFeatures = true },
        },
      },
    }

    -- configure lua server (with special settings)
    lspconfig['lua_ls'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand '$VIMRUNTIME/lua'] = true,
              [vim.fn.stdpath 'config' .. '/lua'] = true,
            },
          },
        },
        pylsp = {
          pylsp_mypy = {
            enabled = true,
            overrides = { '--python-executable', '/home/jnewton/.pyenv/versions/3.11.3/envs/compaero/bin', true },
            report_progress = true,
            live_mode = false,
          },
        },
      },
    }
  end,
}

return M
