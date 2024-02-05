return {
  {
    "linux-cultist/venv-selector.nvim",
    lazy = false,
    config = function()
      require("venv-selector").setup()
      vim.api.nvim_create_autocmd("VimEnter", {
        pattern = "*",
        callback = function()
          local venv = vim.fn.findfile("pyproject.toml", vim.fn.getcwd() .. ";")
          if venv ~= "" then
            require("venv-selector").retrieve_from_cache()
          end
        end,
        once = true,
      })
    end,
  },
}
