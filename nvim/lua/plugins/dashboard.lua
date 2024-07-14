---@type LazySpec
return {
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "NeoVim " .. vim.split(vim.fn.execute('version'), '\n')[3]:sub(6)
      }
      return opts
    end,
  },
}
