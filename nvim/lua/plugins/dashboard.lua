local nvim_version = vim.split(vim.fn.execute("version"), "\n")[3]:sub(6)

return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = "Neovim " .. nvim_version,
        },
      },
    },
  },
}
