return {
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      -- see :h which-key.nvim-which-key-configuration
      opts.sort = { "order", "group", "alphanum", "mod" }
    end,
  },
}
