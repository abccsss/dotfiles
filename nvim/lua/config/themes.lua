local my = vim.g.my or {}

my.colorscheme_dark = "catppuccin-mocha"
my.colorscheme_light = "catppuccin-latte"

my.lualine_theme_light = require("catppuccin.utils.lualine")("latte")
my.lualine_theme_light.normal.a.fg = "#eff1f5"
my.lualine_theme_light.normal.a.bg = "#4080d8"
my.lualine_theme_light.normal.b.fg = "#4080d8"
my.lualine_theme_light.command.a.bg = "#e86820"
my.lualine_theme_light.command.b.fg = "#e86820"

my.lualine_theme_dark = require("catppuccin.utils.lualine")("mocha")

my.highlights_light = {
  CursorLineNr = { fg = "#40b0e0" },

  BufferLineModified = { fg = "#f89060" },
  BufferLineModifiedSelected = { fg = "#f89060" },
  BufferLineModifiedVisible = { fg = "#f89060" },

  -- LaTeX
  Conceal = { link = "texCmd" },
  texConcealedArg = { link = "Normal" },

  texMathZone = { link = "String" },
  texMathArg = { link = "texMathZone" },
  texMathDelim = { link = "texMathZone" },
  texMathOper = { link = "texMathZone" },
  texMathSub = { link = "texMathZone" },
  texMathSuper = { link = "texMathZone" },
  texMathSuperSub = { link = "texMathZone" },

  texEnvOpt = { link = "Normal" },
  texFileOpt = { link = "Normal" },
  texRefConcealedOpt1 = { link = "Normal" },
  texTabularCol = { link = "Normal" },

  texPartArgTitle = { bold = true },
  texTitleArg = { bold = true },

  texCmd = { fg = "#0078d0" },
  texCmdStyle = { link = "texCmd" },
  texDelim = { link = "texCmd" },
  texLigature = { link = "texCmd" },
  texMathSymbol = { link = "texCmd" },
  texSpecialChar = { link = "texCmd" },
  texTabularChar = { link = "texCmd" },

  texCmdPart = { fg = "#0078d0", bold = true },

  texEnvArgName = { link = "Type" },
  texMathEnvArgName = { link = "Type" },

  texRefArg = { fg = "#d070c8" },
  texFileArg = { link = "texRefArg" },
}

my.highlights_dark = {
  Conceal = { link = "Function" },
  texConcealedArg = { link = "Normal" },

  texMathZone = { link = "String" },
  texMathArg = { link = "texMathZone" },
  texMathDelim = { link = "texMathZone" },
  texMathOper = { link = "texMathZone" },
  texMathSub = { link = "texMathZone" },
  texMathSuper = { link = "texMathZone" },
  texMathSuperSub = { link = "texMathZone" },

  texEnvOpt = { link = "Normal" },
  texFileOpt = { link = "Normal" },
  texRefConcealedOpt1 = { link = "Normal" },
  texTabularCol = { link = "Normal" },

  texPartArgTitle = { bold = true },
  texTitleArg = { bold = true },

  texCmd = { link = "Function" },
  texCmdStyle = { link = "texCmd" },
  texDelim = { link = "texCmd" },
  texLigature = { link = "texCmd" },
  texMathSymbol = { link = "texCmd" },
  texSpecialChar = { link = "texCmd" },
  texTabularChar = { link = "texCmd" },

  texCmdPart = { fg = "#89b4fa", bold = true },

  texEnvArgName = { link = "Type" },
  texMathEnvArgName = { link = "Type" },

  texFileArg = { link = "Keyword" },
  texRefArg = { link = "Keyword" },
}

vim.g.my = my
