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