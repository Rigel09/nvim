--- set <Space> as the leader. This has to be done first.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--- bootstrap lazy as the package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

plugins = {
	--- Git related plugins
	"tpope/vim-fugitive", --- Git plugin
	"tpope/vim-rhubarb", --- Allows you to open git URLS?

	--- Detect tabstop and shiftwidth automatically
	--- Changes tab width based on the file being modified
	'tpope/vim-sleuth',
	
	{
          "folke/tokyonight.nvim",
	  lazy = false,
	  priority = 1000,
	  opts = { style = "moon" },
	},


}
opts = {}
require('lazy').setup(plugins, opts)
