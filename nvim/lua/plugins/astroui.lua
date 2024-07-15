-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    highlights = {
      astrolight = {
        Normal = { fg = "#4F4F4F", bg = "#F8F8F8" },
      },
    },
  },
}
