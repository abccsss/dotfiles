local map = vim.keymap.set
local unmap = vim.keymap.del

-- map H M L to move to the beginning, middle, and end of the line
map({ "n", "x", "o" }, "H", "^", { desc = "Beginning of line" })
map({ "n", "o" }, "L", "$", { desc = "End of line" })
map({ "x" }, "L", "$h", { desc = "End of line" })
map({ "n", "x", "o" }, "M", "gM", { desc = "Middle of line" })

-- ctrl+h, ctrl+l to move cursor in insert mode
map("i", "<c-h>", "<left>", { desc = "Move cursor left" })
map("i", "<c-l>", "<right>", { desc = "Move cursor right" })

-- ctrl+backspace to delete word
map("i", "<c-bs>", "<c-w>", { desc = "Delete word" })

-- enter to yank in select mode
map("s", "<cr>", "<c-g>y", { desc = "Yank" })

-- ctrl+shift+s to save without formatting
map("n", "<cs-S>", "<cmd>noa w<cr>", { desc = "Save without formatting" })

-- f7 to toggle terminal
map({ "n", "v", "c", "t" }, "<f7>", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle terminal" })

-- f8 to toggle dark theme
Snacks.toggle
  .option("background", { off = "light", on = "dark", name = "dark theme" })
  :map("<f8>", { mode = { "n", "x", "c", "t" } })

-- LazyVim
unmap("n", "<leader>l")
unmap("n", "<leader>L")
map("n", "<leader>z", "<cmd>Lazy<cr>", { desc = "LazyVim" })
map("n", "<leader>Z", "<cmd>LazyExtras<cr>", { desc = "LazyVim Extras" })
