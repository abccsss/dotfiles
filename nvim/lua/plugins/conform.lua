return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      -- Disable formatting for biblatex
      opts.formatters_by_ft.bib = {}
    end,
  },
}
