local autocmd = vim.api.nvim_create_autocmd

local function apply_custom_highlights()
  local highlights = vim.g.my.highlights_dark
  local lualine_theme = vim.g.my.lualine_theme_dark

  if vim.o.background == "light" then
    highlights = vim.g.my.highlights_light
    lualine_theme = vim.g.my.lualine_theme_light
  end

  for group, hl_spec in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, hl_spec)
  end

  require("lualine").setup({ options = { theme = lualine_theme } })
end

vim.api.nvim_create_user_command("ApplyCustomHighlights", apply_custom_highlights, {})

autocmd("OptionSet", {
  pattern = "background",
  command = "ApplyCustomHighlights",
})

autocmd("VimEnter", {
  command = "ApplyCustomHighlights",
})
