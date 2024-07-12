return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    require("nvim-web-devicons").setup {
      override = {
        NeogitStatus = {
          icon = "󰊢",
          color = "#6f42c1",
          name = "NeogitStatus",
        },
      },
    }
  end,
}
