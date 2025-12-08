return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      picker = {
        formatters = {
          file = {
            filename_first = true, -- display filename before the file path
          },
        },
      },
    },
  },
}
