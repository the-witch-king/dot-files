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
    use 'wbthomason/packer.nvim'

    -- LSP zero
    -- This is all copy pasta'd from their official docs
    use {
      'VonHeikemen/lsp-zero.nvim',
      requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {'williamboman/mason.nvim'},           -- Optional
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},                  -- Required
        {'hrsh7th/cmp-nvim-lsp'},              -- Required
        {'hrsh7th/cmp-buffer'},                -- Optional
        {'hrsh7th/cmp-path'},                  -- Optional
        {'saadparwaiz1/cmp_luasnip'},          -- Optional
        {'hrsh7th/cmp-nvim-lua'},              -- Optional

        -- Snippets
        {'L3MON4D3/LuaSnip'},                  -- Required
        {'rafamadriz/friendly-snippets'},      -- Optional
      }
    }

    -- Treesitter
    use { -- Highlight, edit, and navigate code
      'nvim-treesitter/nvim-treesitter',
      run = function()
        pcall(require('nvim-treesitter.install').update { with_sync = true })
      end,
    }
    use { -- Additional text objects via treesitter
      'nvim-treesitter/nvim-treesitter-textobjects',
      after = 'nvim-treesitter',
    }

    -- Colors, Themes, and Visuals
    use { 'catppuccin/nvim', as = 'catppuccin' }
    use 'nvim-lualine/lualine.nvim' -- Fancier statusline

    -- Detect tabstop and shiftwidth automatically
    use 'tpope/vim-sleuth'

    -- Editing Utils
    use 'numToStr/Comment.nvim' -- 'gc' to comment visual regions/lines

    -- Telescope; Fuzzy Finder (files, lsp, etc)
    use ({
      'nvim-telescope/telescope.nvim',
      requires = {
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
        { "nvim-telescope/telescope-live-grep-args.nvim" },
      }
    })

    -- Get better at vim
    use 'unblevable/quick-scope' -- Unique character highlighting

    -- Git
    use 'tpope/vim-fugitive' -- Git in Vim
    use 'tpope/vim-rhubarb' -- Github in Vim
    use 'rhysd/git-messenger.vim' -- 'Git lens
    use 'lewis6991/gitsigns.nvim' -- Shows git status of lines in gutter

    -- File tree
    use({
      'nvim-neo-tree/neo-tree.nvim',
      branch = 'v2.x',
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
        'MunifTanjim/nui.nvim',
      },

      config = function()
        -- Unless you are still migrating, remove the deprecated commands from v1.x
        vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

        -- If you want icons for diagnostic errors, you'll need to define them somewhere:
        vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })
        vim.fn.sign_define('DiagnosticSignWarn', { text = ' ', texthl = 'DiagnosticSignWarn' })
        vim.fn.sign_define('DiagnosticSignInfo', { text = ' ', texthl = 'DiagnosticSignInfo' })
        vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
      end
    })

    -- For fun
    use 'eandrju/cellular-automaton.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

require('plugin_configs.all')
