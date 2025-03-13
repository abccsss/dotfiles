return {
  { -- override nvim-cmp plugin
    "hrsh7th/nvim-cmp",

    -- lazy load cmp on more keys along with insert mode
    keys = { ":", "/", "?" },

    dependencies = {
      "hrsh7th/cmp-cmdline",
    },

    config = function(_, opts)
      local cmp = require("cmp")

      -- mappings
      opts.mapping["<CR>"] = cmp.mapping(function(fallback)
        if cmp.visible() and cmp.get_selected_entry() then
          cmp.confirm()
        else
          fallback()
        end
      end, { "i", "s", "c" })

      opts.mapping["<C-j>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        else
          fallback()
        end
      end, { "i", "s", "c" })

      opts.mapping["<C-k>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
        else
          fallback()
        end
      end, { "i", "s", "c" })

      opts.experimental = {
        ghost_text = false,
      }

      -- run cmp setup
      cmp.setup(opts)

      -- configure `cmp-cmdline` as described in their repo: https://github.com/hrsh7th/cmp-cmdline#setup
      cmp.setup.cmdline(":", {
        completion = {
          completeopt = "menu,menuone,noselect",
        },
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })

      cmp.setup.cmdline({ "/", "?" }, {
        completion = {
          completeopt = "menu,menuone,noselect",
        },
        sources = cmp.config.sources({
          { name = "buffer" },
        }),
      })
    end,
  },
}
