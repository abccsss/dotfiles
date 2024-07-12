return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        [""] = {
          -- remap H and L to ^ and $
          H = { "^", desc = "Start of line" },
          L = { "$", desc = "End of line" },
        },
        n = {
          -- <Leader>j and <Leader>k to navigate buffers
          ["<Leader>j"] = { ":bprev<cr>", desc = "Previous buffer" },
          ["<Leader>k"] = { ":bnext<cr>", desc = "Next buffer" },

          -- <C-s> to save
          ["<C-s>"] = { ":w!<cr>", desc = "Save file" },
        },
        i = {
          -- <C-s> to save
          ["<C-s>"] = { "<esc>:w!<cr>a", desc = "Save file" },

          -- <C-BS> to delete word backwards
          ["<C-BS>"] = { "<C-w>", desc = "Delete word backwards" },
          ["<C-Del>"] = { "<space><esc>ce", desc = "Delete word forwards" },
        },
        v = {
        },
        o = {
        },
      },
    }
  }
}
