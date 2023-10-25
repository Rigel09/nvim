local M =
{
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = { style = "moon" },
  config = function() require("tokyonight").load() end,
}

return M
