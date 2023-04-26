-- Telescope 
-- See `:help telescope` and `:help telescope.setup()`
local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup {
  defaults = {
    selection_strategy = "reset",
    sorting_strategy = "descending",
    scroll_strategy = "cycle",
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      }
    }
  },
  pickers = {
    find_files = {
      hidden = true,
      -- no_ignore = true,
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
    recent_files = {
      only_cwd = true, -- Only want files in the CWD, of course
    }
  }
}

-- Useful Telescope plugins
require('telescope').load_extension("fzf") -- Enable telescope fzf native, if installed
require("telescope").load_extension("live_grep_args") -- Allow passing live args when grepping
require("telescope").load_extension("recent_files") -- Look at recent files, duh
