-- From packer documentation. Installs packer for you.
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
    -- Default
    use "wbthomason/packer.nvim"

    -- Colors, Themes, and Visuals
    use 'navarasu/onedark.nvim'
    use 'nvim-lualine/lualine.nvim' -- Fancier statusline

    -- Detect tabstop and shiftwidth automatically
    use 'tpope/vim-sleuth'


    -- Editing Utils
    use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines

    -- Search
    use "mhinz/vim-grepper" -- Vim Grepper for RipGrep -> quickFix list
    use "unblevable/quick-scope" -- Unique character highlighting

    -- Telescope; Fuzzy Finder (files, lsp, etc)
    use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
    -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }


    -- Git
    use "tpope/vim-fugitive" -- Git in Vim
    use 'tpope/vim-rhubarb' -- Github in Vim
    use 'rhysd/git-messenger.vim' -- "Git lens
    use 'lewis6991/gitsigns.nvim' -- Shows git status of lines in gutter

    -- Pretty icons
    use { 
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- Icons, duh
      },
      tag = 'nightly'
    }


    
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

-- Set color scheme
vim.cmd [[ colorscheme onedark ]]
-- Set lualine as statusline, see `:help lualine.txt`
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'onedark',
    component_separators = '|',
    section_separators = '',
  },
}


-- Telescope 
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {}
pcall(require('telescope').load_extension, 'fzf') -- Enable telescope fzf native, if installed



-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- Code commenting
require('Comment').setup()

-- Tree
require('nvim-tree').setup()
