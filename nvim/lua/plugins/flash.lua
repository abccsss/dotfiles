return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",

    config = function(_, opts)
      local wk = require("which-key")
      local flash_icon = {
        icon = "⚡",
        hl = "WhichKeyIconYellow",
      }
      wk.add({
        {
          "gs",
          function()
            require("flash").jump()
          end,
          desc = "Flash",
          icon = flash_icon,
          mode = { "n", "x", "o" },
        },
        {
          "gS",
          function()
            require("flash").treesitter()
          end,
          desc = "Flash Treesitter",
          icon = flash_icon,
          mode = { "n", "x", "o" },
        },
        {
          "<C-s>",
          function()
            require("flash").toggle()
          end,
          desc = "Toggle Flash search",
          mode = { "c" },
        },
      })

      require("flash").setup(opts)
    end,

    keys = function()
      -- Disable LazyVim default mappings
      return {}
    end,
  },
}
