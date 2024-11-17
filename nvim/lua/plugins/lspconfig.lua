return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()

      -- Disable [[ ]] mappings
      table.insert(keys, { "[[", false })
      table.insert(keys, { "]]", false })

      -- gR to find references
      table.insert(keys, {
        "gR",
        function()
          vim.lsp.buf.references()
        end,
        mode = "n",
        desc = "Find references",
      })
    end,
  },
}
