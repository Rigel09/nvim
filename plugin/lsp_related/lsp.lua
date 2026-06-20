local home_dir = os.getenv 'HOME'

vim.pack.add { 'https://github.com/neovim/nvim-lspconfig' }

vim.lsp.config('bashls', { filetypes = { 'tmux' } })
vim.lsp.enable 'bashls'

if vim.fn.isdirectory '/tools/Xilinx' == 1 then
  vim.lsp.config('clangd', {
    cmd = {
      home_dir .. '/.local/share/nvim/mason/bin/clangd',
      '--query-driver=/tools/Xilinx/Vitis/2023.1/gnu/aarch32/lin/gcc-arm-none-eabi/bin/*,/usr/bin/*',
    },
  })
end
vim.lsp.enable 'clangd'
vim.lsp.enable 'dockerls'
vim.lsp.enable 'docker_compose_language_service'
vim.lsp.enable 'jsonls'

vim.lsp.config(
  'lua_ls',
  { settings = { Lua = { diagnostics = { globals = { 'vim' } } } } }
)
vim.lsp.enable 'lua_ls'

vim.lsp.enable 'matlab_ls'
-- vim.lsp.enable 'pylsp'
vim.lsp.enable 'basedpyright'
vim.lsp.enable 'yamlls'

local function docker_fix()
  local filename = vim.fn.expand '%:t'

  if filename == 'docker-compose.yaml' then
    vim.bo.filetype = 'yaml.docker-compose'
  end
end
vim.api.nvim_create_autocmd({ 'BufRead' }, { callback = docker_fix })
