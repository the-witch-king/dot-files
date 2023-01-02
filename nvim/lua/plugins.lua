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

return require('packer').startup(function(use)
    -- Default
    use "wbthomason/packer.nvim"

    -- User plugins below

    -- File Tree
    use "tpope/vim-vinegar" -- Makes file tree (netrw) much better

    -- Search
    use "mhinz/vim-grepper" -- Vim Grepper for RipGrep -> quickFix list
    use "unblevable/quick-scope" -- Unique character highlighting
    -- FZF
    use "junegunn/fzf" 
    use "junegunn/fzf.vim"

    -- Git
    use "tpope/vim-fugitive" -- Git in Vim
    use 'rhysd/git-messenger.vim' -- "Git lens
    
    -- LSP
    use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
