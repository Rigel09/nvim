--set <Space> as the leader. This has to be done first.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.autoformat = true

local o = vim.opt

o.autowrite = true --- Autowrite files when you change a buffer?
o.clipboard = "unnamedplus" --- Use the system clipboard
o.completeopt = "menu,menuone,noselect" --- this enables autocomplete dropdowns
o.conceallevel = 3 -- Hide * markup for bold and italic
o.confirm = true -- Confirm to save changes before exiting modified buffer
o.cursorline = true -- Enable highlighting of the current line
o.expandtab = true -- Use spaces instead of tabs
o.grepformat = "%f:%l:%c:%m" --- Turns on ripgrep?
o.grepprg = "rg --vimgrep" --- Turns on ripgrep?
o.formatoptions = "jcroqlnt" -- tcqj Changes autoformat?
o.ignorecase = true -- Ignore case
o.inccommand = "nosplit" -- preview incremental substitute
o.laststatus = 3
o.list = true --- Show some invisible characters like tabs
o.mouse = "a" -- Turn mouse mode on
o.number = true -- Turn on line numbers
o.relativenumber = true -- Turn on relative line numbers by default
o.pumblend = 10 -- Pop up menu transparency
o.pumheight = 10 --relative number of entries in a popup
o.scrolloff = 5 -- Min number of lines to keep above / below the cursor

--- See Here: https://neovim.io/doc/user/options.html
o.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" }
o.shiftround = true -- Shifts will be of multiple width
o.shiftwidth = 2 -- shift width
o.shortmess:append({ W = true, I = true, c = true, C = true })
o.showmode = false -- Dont show mode since we have a statusline
o.sidescrolloff = 8 -- Columns of context
o.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
o.smartcase = true -- Don't ignore case with capitals
o.smartindent = true -- Insert indents automatically
o.spelllang = { "en" }
o.splitbelow = true -- Put new windows below current
o.splitkeep = "screen"
o.splitright = true -- Put new windows right of current
o.tabstop = 2 -- Number of spaces tabs count for
o.termguicolors = true -- True color support

o.timeout = true
o.timeoutlen = 500 -- Time in ms to wait for mapped key sequence
o.ttimeoutlen = 300
o.ttimeout = true
o.undofile = true -- Save undo history to a file
o.undolevels = 3000 --max number of undos
o.updatetime = 200 --num ms of inactivity before swap file is written to disk
o.virtualedit = "block" -- you can place the cursor where there is no visibile character in visual mode only
o.wildmode = "longest:full,full" --command line completion mode
o.winminwidth = 5 -- minimum window width
o.wrap = false -- don't wrap  -  its ugly
o.fillchars = {
  foldopen = "",
  foldclose = "",
  -- fold = "⸱",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

if vim.fn.has("nvim-0.10") == 1 then
  o.smoothscroll = true
end

-- Folding
vim.opt.foldlevel = 99
vim.opt.foldtext = "v:lua.require'lazyvim.util'.ui.foldtext()"

--- TODO: Figure this out. I can't set this?
--- if vim.fn.has("nvim-0.9.0") == 1 then
---   vim.opt.statuscolumn = [[%!v:lua.require'lazyvim.util'.ui.statuscolumn()]]
--- end

-- HACK: causes freezes on <= 0.9, so only enable on >= 0.10 for now
if vim.fn.has("nvim-0.10") == 1 then
  vim.opt.foldmethod = "expr"
  vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
else
  vim.opt.foldmethod = "indent"
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

