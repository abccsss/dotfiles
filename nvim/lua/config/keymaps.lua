-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local unmap = vim.keymap.del

-- map H M L to move to the beginning, middle, and end of the line
map({ "n", "x" }, "H", "^", { desc = "Move to beginning of line" })
map({ "n", "x" }, "L", "$", { desc = "Move to end of line" })
map({ "n", "x" }, "M", "gM", { desc = "Move to middle of line" })

-- ctrl+backspace to delete word
map("i", "<c-bs>", "<c-w>", { desc = "Delete word" })

-- f7 to toggle terminal
map({ "n", "x", "t" }, "<f7>", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle terminal" })

-- f8 to toggle dark theme
Snacks.toggle.option("background", { off = "light", on = "dark", name = "dark theme" }):map("<f8>")

-- LazyVim
unmap("n", "<leader>l")
unmap("n", "<leader>L")
map("n", "<leader>z", "<cmd>Lazy<cr>", { desc = "LazyVim" })
map("n", "<leader>Z", "<cmd>LazyExtras<cr>", { desc = "LazyVim Extras" })
