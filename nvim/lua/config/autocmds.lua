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

autocmd("FileType", {
  pattern = "tex",
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4

    -- Add custom key maps
    local wk = require("which-key")
    local latex_icon = {
      icon = "",
      color = "green",
    }
    wk.add({
      { "<leader>l", group = "VimTeX", icon = latex_icon, buffer = 0 },
      { "<leader>lc", "<plug>(vimtex-clean)", desc = "Clean auxiliary files", buffer = 0 },
      { "<leader>lC", "<plug>(vimtex-clean-full)", desc = "Clean auxiliary, output files", buffer = 0 },
      { "<leader>le", "<plug>(vimtex-errors)", desc = "Show errors", buffer = 0 },
      { "<leader>lg", "<plug>(vimtex-status)", desc = "VimTex status", buffer = 0 },
      { "<leader>lk", "<plug>(vimtex-stop)", desc = "Stop compilation", buffer = 0 },
      { "<leader>ll", "<plug>(vimtex-compile)", desc = "Compile LaTeX", buffer = 0 },
      { "<leader>lt", "<plug>(vimtex-toc-open)", desc = "Open table of contents", buffer = 0 },
      { "<leader>lT", "<plug>(vimtex-toc-toggle)", desc = "Toggle table of contents", buffer = 0 },
      { "<leader>lv", "<plug>(vimtex-view)", desc = "View output", buffer = 0 },
    })

    -- Add surrounds
    require("nvim-surround").buffer_setup({
      surrounds = {
        ["\\"] = {
          add = function()
            local config = require("nvim-surround.config")
            local result = config.get_input("Surround with command: \\")
            if result then
              return { { "\\" .. result .. "{" }, { "}" } }
            end
          end,
        },
        e = {
          add = function()
            local config = require("nvim-surround.config")
            local result = config.get_input("Surround with environment: ")
            if result then
              if string.find(result, " ") then
                local first, rest = string.match(result, "(%S+)%s+(.+)")
                return {
                  { "\\begin{" .. first .. "}[" .. rest .. "]" },
                  { "\\end{" .. first .. "}" },
                }
              else
                return { { "\\begin{" .. result .. "}" }, { "\\end{" .. result .. "}" } }
              end
            end
          end,
        },
        S = {
          add = { "\\smash{", "}" },
        },
      },
    })
  end,
})
