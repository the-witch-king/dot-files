local cmd = vim.cmd

-- Highlight yanked text
cmd [[ autocmd! TextYankPost * lua vim.highlight.on_yank { on_visual = false } ]]

-- Resize buffer on window resize
cmd [[ autocmd VimResized * execute "normal! \<c-w>=" ]]

-- Syntax settings
cmd [[ filetype plugin indent on ]]
cmd [[ syntax on ]]

-- Trigger `autoread` when files change on disk
-- This is default behaviour of most other editors
cmd [[ autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif ]]
cmd [[ autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None ]]

-- Make background transparent
cmd [[ hi Normal guibg=none ctermbg=none ]]
cmd [[ hi LineNr guibg=none ctermbg=none ]]
cmd [[ hi Folded guibg=none ctermbg=none ]]
cmd [[ hi NonText guibg=none ctermbg=none ]]
cmd [[ hi SpecialKey guibg=none ctermbg=none ]]
cmd [[ hi VertSplit guibg=none ctermbg=none ]]
cmd [[ hi SignColumn guibg=none ctermbg=none ]]
cmd [[ hi EndOfBuffer guibg=none ctermbg=none ]]
-- Vertsplit no highlight please
cmd [[ hi VertSplit guibg=none ctermbg=none ]]
