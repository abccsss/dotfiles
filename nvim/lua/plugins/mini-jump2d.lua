return {
  {
    "echasnovski/mini.jump2d",
    event = "VeryLazy",
    version = false,
    config = function()
      local jump2d = require("mini.jump2d")

      -- Custom spotter function
      -- Matches first non-space char in lines of length at least 3
      -- local spotter = jump2d.gen_pattern_spotter("[^%s]..+", "start")

      -- Matches word start every 5 chars
      local spotter = jump2d.gen_pattern_spotter("[^%s%p]..?.?.?.?[^%s%p]*", "start")

      jump2d.setup({
        spotter = spotter,
        labels = "sdfghjklabceimnopqrtuvwxyz",
        allowed_lines = {
          blank = false, -- Blank line (not sent to spotter even if `true`)
          cursor_before = true, -- Lines before cursor line
          cursor_at = true, -- Cursor line
          cursor_after = true, -- Lines after cursor line
          fold = true, -- Start of fold (not sent to spotter even if `true`)
        },
        view = {
          -- Whether to dim lines with at least one jump spot
          dim = true,

          -- How many steps ahead to show. Set to big number to show all steps.
          n_steps_ahead = 10,
        },
      })
    end,
  },
}
