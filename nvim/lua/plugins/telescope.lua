return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      local actions = require("telescope.actions")
      opts.defaults.mappings.i["<C-j>"] = actions.move_selection_next
      opts.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
    end,
    keys = function(_, keys)
      table.insert(keys, { "<c-p>", "<cmd>Telescope find_files<CR>", desc = "Find files", mode = "n" })
      table.insert(keys, { "<leader>gt", "<cmd>Telescope git_status<CR>", desc = "Git status", mode = "n" })
    end,
  },
}
