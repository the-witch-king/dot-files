-- Telescope 
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    selection_strategy = "reset",
    sorting_strategy = "descending",
    scroll_strategy = "cycle",
  },
  pickers = {
    find_files = {
      hidden = true,
      no_ignore = true,
    }
  },
}

-- Useful Telescope plugins
require('telescope').load_extension("fzf") -- Enable telescope fzf native, if installed
require("telescope").load_extension("live_grep_args") -- Allow passing live args when grepping

