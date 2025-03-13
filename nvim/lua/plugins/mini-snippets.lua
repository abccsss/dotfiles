return {
  {
    "echasnovski/mini.snippets",

    config = function(_, opts)
      local mini_snippets = require("mini.snippets")

      opts.snippets = {
        mini_snippets.gen_loader.from_lang(),
      }

      mini_snippets.setup(opts)
    end,
  },

  -- disable friendly-snippets
  {
    "rafamadriz/friendly-snippets",
    enabled = false,
  },
}
