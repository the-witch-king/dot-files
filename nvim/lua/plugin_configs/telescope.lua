-- Telescope 
-- See `:help telescope` and `:help telescope.setup()`
pcall(require('telescope').load_extension, 'fzf') -- Enable telescope fzf native, if installed
require('telescope').setup {
  pickers = {
    find_files = {
      hidden = true
    }
  }
}

