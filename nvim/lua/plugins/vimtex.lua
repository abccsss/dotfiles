-- LaTeX related config also in lua/config/autocmds.lua
-- and lua/config/highlights.lua

return {
  {
    "lervag/vimtex",
    lazy = false,
    config = function()
      -- PDF viewer
      vim.g.vimtex_view_method = "sioyek"
      vim.g.vimtex_view_sioyek_exe = "sioyek.exe"
      vim.g.vimtex_callback_progpath = "wsl nvim"

      -- Conceal; see :help vimtex-syntax-conceal
      vim.g.vimtex_syntax_conceal = {
        accents = 1,
        ligatures = 1,
        cites = 1,
        fancy = 0,
        spacing = 1,
        greek = 1,
        math_bounds = 1,
        math_delimiters = 1,
        math_fracs = 1,
        math_super_sub = 0,
        math_symbols = 1,
        sections = 0,
        styles = 1,
      }

      -- Disable certain mappings
      vim.g.vimtex_mappings_disable = {
        n = { "<F6>", "<F7>", "<F8>" },
        i = { "<F7>" },
        x = { "<F6>", "<F7>" },
      }

      vim.g.vimtex_syntax_custom_cmds = {
        -- Maths symbols
        { name = "dotsc", mathmode = 1, concealchar = "…" },
        { name = "llbr", mathmode = 1, concealchar = "⟦" },
        { name = "rrbr", mathmode = 1, concealchar = "⟧" },
        { name = "llparen", mathmode = 1, concealchar = "⸨" },
        { name = "rrparen", mathmode = 1, concealchar = "⸩" },
        { name = "longleftarrow", mathmode = 1, concealchar = "←" },
        { name = "longrightarrow", mathmode = 1, concealchar = "→" },
        { name = "longleftrightarrow", mathmode = 1, concealchar = "⟷" },
        { name = "longmapsto", mathmode = 1, concealchar = "↦" },
        { name = "mid", mathmode = 1, concealchar = "|" },
        { name = "setminus", mathmode = 1, concealchar = "\\" },
        { name = "simeq", mathmode = 1, concealchar = "≃" },

        -- JetBrains fonts mix up boxtimes and boxplus
        { name = "boxplus", mathmode = 1, concealchar = "⊠" },
        { name = "boxtimes", mathmode = 1, concealchar = "⊞" },

        -- Text commands
        { name = "S", conceal = 1, concealchar = "§" },
        { name = "hyph", cmdre = "-", conceal = 1 },
        { name = "dash", cmdre = "\\=/", conceal = 1, concealchar = "-" },

        -- Misc
        { name = "limits", mathmode = 1, conceal = 1 },
        { name = "smash", conceal = 1 },
        { name = "smash", mathmode = 1, conceal = 1 },
        { name = "newline", cmdre = "\\\\", concealchar = "󰌑" },
        { name = "newline", cmdre = "\\\\", mathmode = 1, concealchar = "󰌑" },
      }

      vim.g.vimtex_syntax_custom_cmds_with_concealed_delims = {}

      -- For defaults, see https://github.com/lervag/vimtex/blob/master/autoload/vimtex/options.vim
      vim.g.vimtex_imaps_leader = ";"
      vim.g.vimtex_imaps_list = {
        { lhs = ":", rhs = "\\colon" },
        { lhs = "0", rhs = "\\varnothing" },
        { lhs = "ah", rhs = "\\leftarrow" },
        { lhs = "aH", rhs = "\\longleftarrow" },
        { lhs = "al", rhs = "\\rightarrow" },
        { lhs = "aL", rhs = "\\longrightarrow" },
        { lhs = "aj", rhs = "\\downarrow" },
        { lhs = "ak", rhs = "\\uparrow" },
        { lhs = "ga", rhs = "\\alpha" },
        { lhs = "gb", rhs = "\\beta" },
        { lhs = "gc", rhs = "\\chi" },
        { lhs = "gd", rhs = "\\delta" },
        { lhs = "ge", rhs = "\\epsilon" },
        { lhs = "gf", rhs = "\\phi" },
        { lhs = "gg", rhs = "\\gamma" },
        { lhs = "gh", rhs = "\\eta" },
        { lhs = "gi", rhs = "\\iota" },
        { lhs = "gj", rhs = "\\theta" },
        { lhs = "gk", rhs = "\\kappa" },
        { lhs = "gl", rhs = "\\lambda" },
        { lhs = "gm", rhs = "\\mu" },
        { lhs = "gn", rhs = "\\nu" },
        { lhs = "gp", rhs = "\\pi" },
        { lhs = "gr", rhs = "\\rho" },
        { lhs = "gs", rhs = "\\sigma" },
        { lhs = "gt", rhs = "\\tau" },
        { lhs = "gu", rhs = "\\upsilon" },
        { lhs = "gve", rhs = "\\varepsilon" },
        { lhs = "gvf", rhs = "\\varphi" },
        { lhs = "gw", rhs = "\\omega" },
        { lhs = "gx", rhs = "\\xi" },
        { lhs = "gy", rhs = "\\psi" },
        { lhs = "gz", rhs = "\\zeta" },
        { lhs = "gD", rhs = "\\Delta" },
        { lhs = "gF", rhs = "\\Phi" },
        { lhs = "gG", rhs = "\\Gamma" },
        { lhs = "gJ", rhs = "\\Theta" },
        { lhs = "gL", rhs = "\\Lambda" },
        { lhs = "gP", rhs = "\\Pi" },
        { lhs = "gS", rhs = "\\Sigma" },
        { lhs = "gU", rhs = "\\Upsilon" },
        { lhs = "gW", rhs = "\\Omega" },
        { lhs = "gX", rhs = "\\Xi" },
        { lhs = "gY", rhs = "\\Psi" },
        { lhs = "b", rhs = "vimtex#imaps#style_math('mathbb')", expr = 1 },
        { lhs = "c", rhs = "vimtex#imaps#style_math('mathcal')", expr = 1 },
        { lhs = "f", rhs = "vimtex#imaps#style_math('mathfrak')", expr = 1 },
        { lhs = "u", rhs = "vimtex#imaps#style_math('mathrm')", expr = 1 },
        {
          lhs = "r",
          rhs = "'\\mathrm{' . input('Wrap in \\mathrm: ') . '}'",
          expr = 1,
          wrapper = "vimtex#imaps#wrap_trivial",
        },
        {
          lhs = "s",
          rhs = "'\\mathsf{' . input('Wrap in \\mathsf: ') . '}'",
          expr = 1,
          wrapper = "vimtex#imaps#wrap_trivial",
        },
        {
          lhs = "o",
          rhs = "'\\operatorname{' . input('Wrap in \\operatorname: ') . '}'",
          expr = 1,
          wrapper = "vimtex#imaps#wrap_trivial",
        },
        {
          lhs = "O",
          rhs = "'\\operatornamewithlimits{' . input('Wrap in \\operatornamewithlimits: ') . '}'",
          expr = 1,
          wrapper = "vimtex#imaps#wrap_trivial",
        },
      }
    end,
  },
}
