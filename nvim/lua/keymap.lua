local leader = "<space>"
local cr = "<cr>"
local keymap = vim.keymap
local set = keymap.set

-- Switch buffers by holding CTRL and direction
-- VIM default requires you to hit 'w' every time
nmap("<C-J>", "<C-W><C-J>")
nmap("<C-K>", "<C-W><C-K>")
nmap("<C-L>", "<C-W><C-L>")
nmap("<C-H>", "<C-W><C-H>")

-- Copy filename + path (relative) to clipboard
nmap(leader .. "pp", [[ :let @+=expand("%") ]] .. cr)

-- Search commands
nmap(leader .. "/", ":nohlsearch" .. cr)
nmap(leader .. "h", ":History" .. cr)
nmap(leader .. "G", ":Grepper -tool rg" .. cr)

-- netrw
nmap("-", ":Explore<CR>")

-- Telescope
local tele = require("telescope")
local tb = require("telescope.builtin")
set("n", leader .. "f", tb.find_files)
set("n", leader .. leader, tb.live_grep)
set("n", leader .. "s", tb.grep_string)
set("n", leader .. "q", tb.resume)
set("n", leader .. "h", tele.extensions.recent_files.pick)
-- Maybe useful?
set("n", leader .. "km", tb.keymaps)
set("n", leader .. "kc", tb.commands)
set("n", leader .. "mm", tb.marks)

-- Nvim Tree
nmap(leader .. "-", ":Neotree" .. cr)

-- LSP
set("n", leader .. "rn", vim.lsp.buf.rename)
set("n", leader .. "ca", vim.lsp.buf.code_action)
set("n", leader .. "z", vim.lsp.buf.signature_help)
set("n", leader .. "F", vim.lsp.buf.format)

-- Python specific
set("n", leader .. "dp", ":PythonCopyReferenceDotted"..cr..cr)
