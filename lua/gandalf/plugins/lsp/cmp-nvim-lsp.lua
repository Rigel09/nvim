local M =
{
  "hrsh7th/cmp-nvim-lsp",
  event = "VeryLazy",
-- config = function() require("cmp_nvim_lsp").setup({
--   sources = {
--     { name = "nvim_lsp" }
--   }
-- })
-- end,
  dependencies = {
    'hrsh7th/nvim-cmp'
  },
}

return M
