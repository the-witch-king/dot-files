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
nmap(leader.."pp", [[ :let @+=expand("%") ]]..cr)

-- Search commands
nmap(leader.."/", ":nohlsearch"..cr)
nmap(leader.."h", ":History"..cr)
nmap(leader.."G", ":Grepper -tool rg"..cr)

-- netrw
nmap('-', ":Explore<CR>")

-- Telescope
local tb = 'telescope.builtin'
set('n', leader.."f", require(tb).find_files)
set('n', leader..leader, require(tb).live_grep)
set('n', leader.."s", require(tb).grep_string)
set('n', leader.."h", require(tb).oldfiles)
-- Maybe useful?
set('n', leader.."km", require(tb).keymaps)
set('n', leader.."kc", require(tb).commands)
set('n', leader.."mm", require(tb).marks)

-- Nvim Tree
nmap(leader.."-", ":Neotree"..cr)
