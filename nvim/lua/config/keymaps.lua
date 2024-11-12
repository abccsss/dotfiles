-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local unmap = vim.keymap.del

-- map H L to move to the beginning and end of the line
map({ "n", "x" }, "H", "^", { desc = "Move to beginning of line" })
map({ "n", "x" }, "L", "$", { desc = "Move to end of line" })

-- f7 to toggle terminal
map({ "n", "x", "t" }, "<f7>", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle terminal" })

-- toggle dark theme
Snacks.toggle.option("background", { off = "light", on = "dark", name = "dark theme" }):map("<f8>")

-- disable <leader>l
unmap("n", "<leader>l")
unmap("n", "<leader>L")
map("n", "<leader>z", "<cmd>LazyVim<cr>", { desc = "Lazy" })
