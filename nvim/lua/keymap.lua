local leader = "<space>"
local cr = "<cr>"

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
vim.keymap.set('n', leader.."f", require('telescope.builtin').find_files)
vim.keymap.set('n', leader..leader, require('telescope.builtin').live_grep)
vim.keymap.set('n', leader.."h", require('telescope.builtin').oldfiles)
vim.keymap.set('n', leader.."km", require('telescope.builtin').keymaps)
vim.keymap.set('n', leader.."kc", require('telescope.builtin').commands)
vim.keymap.set('n', leader.."mm", require('telescope.builtin').marks)

-- Nvim Tree
local increment = 10
nmap(leader.."tt", " :NvimTreeToggle<CR> ")
-- nmap(leader.."tp", " :NvimTreeResize +"..increment.."<CR> ")
-- nmap(leader.."tP", " :NvimTreeResize -"..increment.."<CR> ")
