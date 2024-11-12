local my = vim.g.my or {}

my.colorscheme_dark = "catppuccin-mocha"
my.colorscheme_light = "catppuccin-latte"

my.lualine_theme_light = require("catppuccin.utils.lualine")("latte")
my.lualine_theme_light.normal.a.bg = "#0080c8"
my.lualine_theme_light.normal.b.fg = "#0080c8"

my.lualine_theme_dark = require("catppuccin.utils.lualine")("mocha")

my.highlights_light = {
  -- LaTeX
  Conceal = { fg = "#0060A8" },
  texConcealedArg = { fg = "#4F4F4F" },

  texMathArg = { fg = "#408020" },
  texMathDelim = { fg = "#408020" },
  texMathOper = { fg = "#408020" },
  texMathSub = { fg = "#408020" },
  texMathSuper = { fg = "#408020" },
  texMathSuperSub = { fg = "#408020" },
  texMathZone = { fg = "#408020" },

  texEnvOpt = { fg = "#4F4F4F" },
  texFileOpt = { fg = "#4F4F4F" },
  texRefConcealedOpt1 = { fg = "#4F4F4F" },
  texPartArgTitle = { fg = "#4F4F4F", bold = true },
  texTitleArg = { fg = "#4F4F4F", bold = true },

  bibType = { fg = "#0060A8" },
  texCmd = { fg = "#0060A8" },
  texDelim = { fg = "#0060A8" },
  texMathSymbol = { fg = "#0060A8" },
  texSpecialChar = { fg = "#0060A8" },

  texCmdPart = { fg = "#0060A8", bold = true },

  texEnvArgName = { fg = "#D66C00" },
  texMathEnvArgName = { fg = "#D66C00" },

  bibKey = { fg = "#A01090" },
  texRefArg = { fg = "#A01090" },

  bibEntryKw = { fg = "#408020" },
  bibVariable = { fg = "#408020", italic = true },
}

my.highlights_dark = {
  Conceal = { link = "Function" },
  texConcealedArg = { fg = "#cdd6f4" },

  texMathArg = { fg = "#a6e3a1" },
  texMathDelim = { fg = "#a6e3a1" },
  texMathOper = { fg = "#a6e3a1" },
  texMathSub = { fg = "#a6e3a1" },
  texMathSuper = { fg = "#a6e3a1" },
  texMathSuperSub = { fg = "#a6e3a1" },
  texMathZone = { fg = "#a6e3a1" },

  texEnvOpt = { fg = "#cdd6f4" },
  texFileOpt = { fg = "#cdd6f4" },
  texRefConcealedOpt1 = { fg = "#cdd6f4" },
  texPartArgTitle = { fg = "#cdd6f4", bold = true },
  texTitleArg = { fg = "#cdd6f4", bold = true },

  bibType = { link = "Function" },
  texCmd = { link = "Function" },
  texDelim = { link = "Function" },
  texMathSymbol = { link = "Function" },
  texSpecialChar = { link = "Function" },

  texCmdPart = { fg = "#89b4fa", bold = true },

  texEnvArgName = { fg = "#f9e2af" },
  texMathEnvArgName = { fg = "#f9e2af" },

  bibKey = { fg = "#cba6f7" },
  texRefArg = { fg = "#cba6f7" },

  bibEntryKw = { fg = "#a6e3a1" },
  bibVariable = { fg = "#a6e3a1", italic = true },
}

vim.g.my = my
