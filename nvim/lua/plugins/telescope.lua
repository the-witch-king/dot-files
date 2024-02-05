return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>km",
        function()
          require("telescope.builtin").keymaps()
        end,
        desc = "Search keymaps",
      },
      {
        "<leader>tr",
        function()
          require("telescope.builtin").resume()
        end,
        desc = "Resume last telescope search",
      },
      {
        "<leader>ts",
        function()
          require("telescope.builtin").grep_string()
        end,
        desc = "Search for word under cursor",
      },
    },
  },
}
