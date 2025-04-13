---@diagnostic disable-next-line: unused-local
local my_attach_func = function(client, bufnr)
  local keymap = vim.keymap -- for conciseness
  local opts = { noremap = true, silent = true }

  opts.buffer = bufnr

  opts.desc = 'Show documentation for what is under cursor'
  keymap.set('n', 'K', vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

  opts.desc = 'Show signature for what is under cursor'
  keymap.set('n', 'S', vim.lsp.buf.signature_help, opts) -- show signature for what is under cursor

  opts.desc = 'Restart LSP'
  keymap.set('n', '<leader>rs', ':LspRestart<CR>', opts) -- mapping to restart lsp if necessary
end

-- ================================================================================================
-- ================================================================================================
local M = {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    { 'antosha417/nvim-lsp-file-operations', config = true },
  },
  config = function()
    local lspconfig = require 'lspconfig'
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    -- -------------------------------------
    -- BASH
    -- -------------------------------------
    lspconfig['bashls'].setup {
      capabilities = capabilities,
      on_attach = my_attach_func,
      filetypes = { 'tmux' },
    }

    -- -------------------------------------
    -- C++
    -- -------------------------------------
    lspconfig['clangd'].setup {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        my_attach_func(client, bufnr)
      end,
    }

    -- lspconfig['cmake'].setup {
    --   capabilities = capabilities,
    --   on_attach = my_attach_func,
    -- }

    lspconfig['dockerls'].setup {
      capabilities = capabilities,
      on_attach = my_attach_func,
    }

    lspconfig['docker_compose_language_service'].setup {
      capabilities = capabilities,
      on_attach = my_attach_func,
    }

    local function docker_fix()
      local filename = vim.fn.expand '%:t'

      if filename == 'docker-compose.yaml' then
        vim.bo.filetype = 'yaml.docker-compose'
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
      },
    }

    -- -------------------------------------
    -- MATLAB
    -- -------------------------------------
    lspconfig['matlab_ls'].setup {
      capabilities = capabilities,
      on_attach = my_attach_func,
    }

    -- -------------------------------------
    -- Python
    -- -------------------------------------
    lspconfig['basedpyright'].setup {
      capabilities = capabilities,
      on_attach = my_attach_func,
    }

    lspconfig['yamlls'].setup {
      capabilities = capabilities,
      on_attach = my_attach_func,
    }
  end,
}

return M
