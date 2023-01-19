-- Set color scheme
require("catppuccin").setup({
    flavour = "frappe", -- latte, frappe, macchiato, mocha
    transparent_background = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        telescope = true,
        neotree = true,
        treesitter_context = true,
        lsp_trouble = true,
    },
})
vim.cmd.colorscheme "catppuccin"

