return {
  {
    "folke/flash.nvim",
    keys = {
      -- disable the default flash keymap
      { "s", mode = { "n", "x", "o" }, false },
      { "S", mode = { "n", "x", "o" }, false },
    },
    config = function(_, opts)
      opts.modes = {
        char = { jump_labels = true },
      }
      require("flash").setup(opts)
    end,
  },
}
