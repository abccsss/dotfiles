return {
  {
    "github/copilot.vim",
    config = function()
      vim.keymap.set("i", "<S-Tab>", "<Plug>(copilot-accept-word)")
    end,
  },
}
