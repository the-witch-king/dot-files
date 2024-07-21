-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("n", "<leader>fy", ":let @+=expand('%')<cr>", { desc = "Copy filename to clipboard" })
map("n", "<leader><C-h>", "<cmd>vertical resize -15<cr>", { desc = "Decrease Window Width" })
map("n", "<leader><C-l>", "<cmd>vertical resize +15<cr>", { desc = "Increase Window Width" })
