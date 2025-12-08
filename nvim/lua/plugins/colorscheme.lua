-- "sainnhe/everforest"
-- "morhetz/gruvbox"
-- "rebelot/kanagawa.nvim"
-- "folke/tokyonight.nvim",
-- "catppuccin/nvim"
-- "ellisonleao/gruvbox.nvim",
return {
  {
    "ellisonleao/gruvbox.nvim",
    opts = { transparent_mode = true },
  },
  -- {
  --   "olimorris/onedarkpro.nvim",
  --   priority = 1000, -- Ensure it loads first
  -- },

  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "onedark",
      colorscheme = "gruvbox",
    },
  },

  -- {
  --   "LazyVime/LazyVim",
  --   opts = { colorscheme = "gruvbox" },
  -- },
  -- {
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     -- load the colorscheme here
  --     vim.cmd([[colorscheme gruvbox]])
  --   end,
  --   opts = {
  --     transparent_mode = true,
  --   },
  -- },
}
