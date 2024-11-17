if not vim.g.neovide then
  return
end

local map = vim.keymap.set

-- Neovide options
vim.g.neovide_theme = "auto"
vim.g.neovide_floating_shadow = false
vim.o.guifont = "JetBrainsMono Nerd Font,JuliaMono:h14:#h-full"

-- Mappings to change scale factor
map(
  "n",
  "<c-=>",
  "<cmd>lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<cr>",
  { desc = "Increase scale factor" }
)
map(
  "n",
  "<c-->",
  "<cmd>lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<cr>",
  { desc = "Decrease scale factor" }
)
map("n", "<c-0>", "<cmd>lua vim.g.neovide_scale_factor = 1<cr>", { desc = "Reset scale factor" })
