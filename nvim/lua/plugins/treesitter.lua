return {
  "nvim-treesitter/nvim-treesitter",

  opts = function(_, opts)
    table.insert(opts.ensure_installed, "bibtex")
    table.insert(opts.ensure_installed, "latex")
    table.insert(opts.ensure_installed, "rust")

    opts.highlight = {
      enable = true,
      disable = { "latex" },
    }
  end,
}
