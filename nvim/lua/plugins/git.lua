return {
  { "tpope/vim-fugitive" },
  { "tpope/vim-rhubarb" },
  {
    "ruifm/gitlinker.nvim",
    config = function()
      require("gitlinker").setup({ mappings = nil })
    end,
    keys = {
      { "<leader>gy", "<cmd>lua require('gitlinker').get_repo_url()<cr>", desc = "Copy Github URL", silent = true },
    },
  },
}
