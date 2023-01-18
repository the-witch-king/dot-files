local o = vim.opt
local g = vim.g
local d = vim.diagnostic
local api = vim.api

o.showcmd = true
o.number = true
o.diffopt = vertical
o.splitbelow = true
o.splitright = true
o.swapfile = false
o.showmode = false

-- Search settings
-- Live substitution
o.inccommand = 'nosplit'
o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.incsearch = true

-- Whitespace and such
o.formatoptions = 'rnj1' -- q  - comment formatting; n - numbered lists; j - remove comment when joining lines; 1 - don't break after one-letter word


-- Indentation settings
o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2

-- Sign column, used for gitsigns to always be available
o.signcolumn = 'yes'

-- Leader keys
g.mapleader = " "
g.maplocalleader = " "

-- Folding
o.fdm = "syntax"
o.foldlevelstart = 4


-- Save undo history
o.undofile = true

-- Set colorscheme
o.termguicolors = true

-- Set completeopt to have a better completion experience
o.completeopt = 'menuone,noselect'

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
