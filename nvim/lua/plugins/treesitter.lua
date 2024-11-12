return {
  "nvim-treesitter/nvim-treesitter",

  opts = function(_, opts)
    opts.highlight = {
      enable = true,
      disable = { "bibtex", "latex" },
    }
  end,
}
