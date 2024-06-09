local M = {
  'rmagatti/goto-preview',
  keys = {
    { '<leader>gpd', '<cmd>lua require("goto-preview").goto_preview_definition()<CR>', desc = 'Goto preview definition' },
    { '<leader>gpt', '<cmd>lua require("goto-preview").goto_preview_type_definition()<CR>', desc = 'Goto preview type definition' },
    { '<leader>gpi', '<cmd>lua require("goto-preview").goto_preview_implementation()<CR>', desc = 'Goto preview implementation' },
    { '<leader>gpD', '<cmd>lua require("goto-preview").goto_preview_declaration()<CR>', desc = 'Goto preview declaration' },
    { '<leader>gP', '<cmd>lua require("goto-preview").close_all_win()<CR>', desc = 'Close all GOTO Windows' },
    { '<leader>gpr', '<cmd>lua require("goto-preview").goto_preview_references()<CR>', desc = 'Goto preview references' },
  },
  config = true,
}
return M
