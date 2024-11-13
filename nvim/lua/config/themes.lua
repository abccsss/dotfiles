local my = vim.g.my or {}

my.colorscheme_dark = "catppuccin-mocha"
my.colorscheme_light = "catppuccin-latte"

my.lualine_theme_light = require("catppuccin.utils.lualine")("latte")
my.lualine_theme_light.normal.a.bg = "#4090e0"
my.lualine_theme_light.normal.b.fg = "#4090e0"

my.lualine_theme_dark = require("catppuccin.utils.lualine")("mocha")

my.highlights_light = {
  CursorLineNr = { fg = "#40b0e0" },

  BufferLineModified = { fg = "#f89060" },
  BufferLineModifiedSelected = { fg = "#f89060" },
  BufferLineModifiedVisible = { fg = "#f89060" },

  -- LaTeX
  Conceal = { fg = "#0080c8" },
  texConcealedArg = { link = "Normal" },

  texMathArg = { fg = "#408020" },
  texMathDelim = { fg = "#408020" },
  texMathOper = { fg = "#408020" },
  texMathSub = { fg = "#408020" },
  texMathSuper = { fg = "#408020" },
  texMathSuperSub = { fg = "#408020" },
  texMathZone = { fg = "#408020" },

  texEnvOpt = { link = "Normal" },
  texFileOpt = { link = "Normal" },
  texRefConcealedOpt1 = { link = "Normal" },
  texTabularCol = { link = "Normal" },

  texPartArgTitle = { fg = "#4F4F4F", bold = true },
  texTitleArg = { fg = "#4F4F4F", bold = true },

  bibType = { fg = "#0080c8" },
  texCmd = { fg = "#0080c8" },
  texDelim = { fg = "#0080c8" },
  texLigature = { fg = "#0080c8" },
  texMathSymbol = { fg = "#0080c8" },
  texSpecialChar = { fg = "#0080c8" },
  texTabularChar = { fg = "#0080c8" },

  texCmdPart = { fg = "#0080c8", bold = true },

  texEnvArgName = { fg = "#D66C00" },
  texMathEnvArgName = { fg = "#D66C00" },

  bibKey = { fg = "#b010c0" },
  texFileArg = { fg = "#b010c0" },
  texRefArg = { fg = "#b010c0" },

  bibEntryKw = { fg = "#408020" },
  bibVariable = { fg = "#408020", italic = true },
}

my.highlights_dark = {
  Conceal = { link = "Function" },
  texConcealedArg = { link = "Normal" },

  texMathArg = { fg = "#a6e3a1" },
  texMathDelim = { fg = "#a6e3a1" },
  texMathOper = { fg = "#a6e3a1" },
  texMathSub = { fg = "#a6e3a1" },
  texMathSuper = { fg = "#a6e3a1" },
  texMathSuperSub = { fg = "#a6e3a1" },
  texMathZone = { fg = "#a6e3a1" },

  texEnvOpt = { link = "Normal" },
  texFileOpt = { link = "Normal" },
  texRefConcealedOpt1 = { link = "Normal" },
  texTabularCol = { link = "Normal" },

  texPartArgTitle = { fg = "#cdd6f4", bold = true },
  texTitleArg = { fg = "#cdd6f4", bold = true },

  bibType = { link = "Function" },
  texCmd = { link = "Function" },
  texDelim = { link = "Function" },
  texLigature = { link = "Function" },
  texMathSymbol = { link = "Function" },
  texSpecialChar = { link = "Function" },
  texTabularChar = { link = "Function" },

  texCmdPart = { fg = "#89b4fa", bold = true },

  texEnvArgName = { fg = "#f9e2af" },
  texMathEnvArgName = { fg = "#f9e2af" },

  bibKey = { fg = "#cba6f7" },
  texFileArg = { fg = "#cba6f7" },
  texRefArg = { fg = "#cba6f7" },

  bibEntryKw = { fg = "#a6e3a1" },
  bibVariable = { fg = "#a6e3a1", italic = true },
}

vim.g.my = my
