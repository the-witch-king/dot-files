local o = vim.opt
local g = vim.g
local d = vim.diagnostic

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
o.formatoptions = 'qnj1' -- q  - comment formatting; n - numbered lists; j - remove comment when joining lines; 1 - don't break after one-letter word


-- Indentation settings
o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2

-- Leader keys
g.mapleader = " "
g.maplocalleader = " "

-- Folding
o.fdm = "syntax"
o.foldlevelstart = 4