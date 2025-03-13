return {
  {
    "Exafunction/codeium.vim",
    event = "VeryLazy",
    config = function()
      vim.keymap.set("i", "<Tab>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<C-l>", function()
        return vim.fn["codeium#AcceptNextWord"]()
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<C-;>", function()
        return vim.fn["codeium#AcceptNextLine"]()
      end, { expr = true, silent = true })
    end,
  },
}
