return {
  {
    "nvimdev/dashboard-nvim",
    lazy = false,
    opts = function(_, opts)
      -- customize the dashboard header
      local header = {
        "",
        "",
        "",
        "",
        "",
        "",
        "Neovim " .. vim.split(vim.fn.execute("version"), "\n")[3]:sub(6),
        "",
        "",
      }
      opts.config.header = header

      return opts
    end,
  },
}
