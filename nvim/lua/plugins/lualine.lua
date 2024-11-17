return {
  {
    "nvim-lualine/lualine.nvim",

    -- Modified version of LazyVim defaults at:
    -- https://www.lazyvim.org/plugins/ui
    opts = function(_, opts)
      opts.sections.lualine_c = {
        {
          "diagnostics",
          symbols = {
            error = LazyVim.config.icons.diagnostics.Error,
            warn = LazyVim.config.icons.diagnostics.Warn,
            info = LazyVim.config.icons.diagnostics.Info,
            hint = LazyVim.config.icons.diagnostics.Hint,
          },
        },
        LazyVim.lualine.root_dir(),
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        { LazyVim.lualine.pretty_path() },
      }

      -- Color of copilot icon
      opts.sections.lualine_x[2].color = function()
        return LazyVim.ui.fg("Special")
      end

      -- Remove lazy.status which shows number of plugins
      table.remove(opts.sections.lualine_x, 4)

      -- Git diff symbols
      opts.sections.lualine_x[4].symbols = {
        added = "+",
        modified = "~",
        removed = "-",
      }

      -- Filetype
      opts.sections.lualine_y = {
        { "encoding", separator = "", padding = { left = 1, right = 0 } },
        { "bo:filetype" },
      }

      -- Location
      opts.sections.lualine_z = {
        { "progress", separator = "", padding = { left = 1, right = 0 } },
        { "location" },
      }

      -- -- Show aerial symbols in winbar (top bar)
      -- opts.winbar = {
      --   lualine_c = {
      --     { "aerial", sep = "  ", sep_icon = "" },
      --   },
      -- }

      -- Show trouble symbols in winbar (top bar)
      local trouble = require("trouble")
      local symbols = trouble.statusline({
        mode = "symbols",
        groups = {},
        title = false,
        filter = { range = true },
        -- seems undocumented:
        -- {hl:...} changes the hl group of the following text
        format = "{kind_icon}{hl:NonText}{symbol.name} ",
      })
      opts.winbar = {
        lualine_c = {
          {
            symbols and symbols.get,
            cond = function()
              return vim.b.trouble_lualine ~= false and symbols.has()
            end,
          },
        },
      }
    end,
  },
}