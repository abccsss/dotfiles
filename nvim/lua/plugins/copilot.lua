return {
  "github/copilot.vim",
  config = function()
    vim.keymap.set("i", "<C-Tab>", "<Plug>(copilot-accept-word)")
  end,
}
