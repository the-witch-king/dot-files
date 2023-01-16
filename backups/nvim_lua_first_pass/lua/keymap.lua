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
nmap(leader.."f", ":GFiles"..cr)
nmap(leader.."/", ":nohlsearch"..cr)
nmap(leader.."h", ":History"..cr)
nmap(leader.."G", ":Grepper -tool rg"..cr)
nmap(leader.."<space>", ":Rg"..cr)