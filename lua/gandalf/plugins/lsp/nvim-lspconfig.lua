local my_attach_func = function(client, bufnr)
  local keymap = vim.keymap -- for conciseness
  local opts = { noremap = true, silent = true }

  opts.buffer = bufnr

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

local border = {
  { '🭽', 'FloatBorder' },
  { '▔', 'FloatBorder' },
  { '🭾', 'FloatBorder' },
  { '▕', 'FloatBorder' },
  { '🭿', 'FloatBorder' },
  { '▁', 'FloatBorder' },
  { '🭼', 'FloatBorder' },
  { '▏', 'FloatBorder' },
}

-- LSP settings (for overriding per client)
local handlers = {
  ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
  ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

-- ================================================================================================
-- ================================================================================================
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
    require('neoconf').setup {}
    require('neodev').setup()

    -- ********************************************************************************************
    -- import lspconfig plugin
    -- ********************************************************************************************

    -- This is for adding borders around popup docs
    vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
    vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

    local lspconfig = require 'lspconfig'

    -- ********************************************************************************************
    -- import cmp-nvim-lsp plugin
    -- ********************************************************************************************
    local cmp_nvim_lsp = require 'cmp_nvim_lsp'

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

    -- ********************************************************************************************
    -- Server Setup
    -- ********************************************************************************************

    -- -------------------------------------
    -- BASH
    -- -------------------------------------
    lspconfig['bashls'].setup {
      capabilities = capabilities,
      handlers = handlers,
      on_attach = my_attach_func,
      filetypes = { 'tmux' },
    }

    -- -------------------------------------
    -- C++
    -- -------------------------------------
    lspconfig['clangd'].setup {
      capabilities = capabilities,
      handlers = handlers,
      on_attach = function(client, bufnr)
        my_attach_func(client, bufnr)
        require('clangd_extensions.inlay_hints').setup_autocmd()
        require('clangd_extensions.inlay_hints').set_inlay_hints()
      end,
    }

    lspconfig['cmake'].setup {
      capabilities = capabilities,
      handlers = handlers,
      on_attach = my_attach_func,
    }

    lspconfig['dockerls'].setup {
      capabilities = capabilities,
      handlers = handlers,
      on_attach = my_attach_func,
    }

    lspconfig['docker_compose_language_service'].setup {
      capabilities = capabilities,
      handlers = handlers,
      on_attach = my_attach_func,
    }

    local function docker_fix()
      local filename = vim.fn.expand '%:t'

      if filename == 'docker-compose.yaml' then
        vim.bo.filetype = 'yaml.docker-compose'
        print 'matched!'
      else
        print(filename)
      end
    end
    vim.api.nvim_create_autocmd({ 'BufRead' }, { callback = docker_fix })

    -- -------------------------------------
    -- Lua
    -- -------------------------------------
    lspconfig['lua_ls'].setup {
      capabilities = capabilities,
      on_attach = my_attach_func,
      handlers = handlers,
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

    -- -------------------------------------
    -- MATLAB
    -- -------------------------------------
    lspconfig['matlab_ls'].setup {
      capabilities = capabilities,
      handlers = handlers,
      on_attach = my_attach_func,
    }

    -- -------------------------------------
    -- Rust
    -- -------------------------------------
    -- lspconfig['rust_analyzer'].setup {
    --   capabilities = capabilities,
    --   handlers = handlers,
    --   on_attach = my_attach_func,
    --   filetypes = { 'rust' },
    --   root_dir = require('lspconfig.util').root_pattern 'Cargo.toml',
    --   settings = {
    --     ['rust_analyzer'] = {
    --       checkOnSave = {
    --         enable = true,
    --         command = 'clippy',
    --       },
    --       cargo = { allFeatures = true },
    --     },
    --   },
    -- }

    -- -------------------------------------
    -- Python
    -- -------------------------------------
    lspconfig['pylsp'].setup {
      handlers = handlers,
      capabilities = capabilities,
      on_attach = my_attach_func,
    }

    lspconfig['yamlls'].setup {
      handlers = handlers,
      capabilities = capabilities,
      on_attach = my_attach_func,
    }
  end,
}

return M
