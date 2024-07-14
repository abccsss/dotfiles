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

      vim.g.vimtex_syntax_custom_cmds = {
        -- Maths symbols
        { name = "bbA", mathmode = 1, concealchar = "𝔸" },
        { name = "bbB", mathmode = 1, concealchar = "𝔹" },
        { name = "bbC", mathmode = 1, concealchar = "ℂ" },
        { name = "bbD", mathmode = 1, concealchar = "𝔻" },
        { name = "bbE", mathmode = 1, concealchar = "𝔼" },
        { name = "bbF", mathmode = 1, concealchar = "𝔽" },
        { name = "bbG", mathmode = 1, concealchar = "𝔾" },
        { name = "bbH", mathmode = 1, concealchar = "ℍ" },
        { name = "bbI", mathmode = 1, concealchar = "𝕀" },
        { name = "bbJ", mathmode = 1, concealchar = "𝕁" },
        { name = "bbK", mathmode = 1, concealchar = "𝕂" },
        { name = "bbL", mathmode = 1, concealchar = "𝕃" },
        { name = "bbM", mathmode = 1, concealchar = "𝕄" },
        { name = "bbN", mathmode = 1, concealchar = "ℕ" },
        { name = "bbO", mathmode = 1, concealchar = "𝕆" },
        { name = "bbP", mathmode = 1, concealchar = "ℙ" },
        { name = "bbQ", mathmode = 1, concealchar = "ℚ" },
        { name = "bbR", mathmode = 1, concealchar = "ℝ" },
        { name = "bbS", mathmode = 1, concealchar = "𝕊" },
        { name = "bbT", mathmode = 1, concealchar = "𝕋" },
        { name = "bbU", mathmode = 1, concealchar = "𝕌" },
        { name = "bbV", mathmode = 1, concealchar = "𝕍" },
        { name = "bbW", mathmode = 1, concealchar = "𝕎" },
        { name = "bbX", mathmode = 1, concealchar = "𝕏" },
        { name = "bbY", mathmode = 1, concealchar = "𝕐" },
        { name = "bbZ", mathmode = 1, concealchar = "ℤ" },
        { name = "calA", mathmode = 1, concealchar = "𝒜" },
        { name = "calB", mathmode = 1, concealchar = "ℬ" },
        { name = "calC", mathmode = 1, concealchar = "𝒞" },
        { name = "calD", mathmode = 1, concealchar = "𝒟" },
        { name = "calE", mathmode = 1, concealchar = "ℰ" },
        { name = "calF", mathmode = 1, concealchar = "ℱ" },
        { name = "calG", mathmode = 1, concealchar = "𝒢" },
        { name = "calH", mathmode = 1, concealchar = "ℋ" },
        { name = "calI", mathmode = 1, concealchar = "ℐ" },
        { name = "calJ", mathmode = 1, concealchar = "𝒥" },
        { name = "calK", mathmode = 1, concealchar = "𝒦" },
        { name = "calL", mathmode = 1, concealchar = "ℒ" },
        { name = "calM", mathmode = 1, concealchar = "ℳ" },
        { name = "calN", mathmode = 1, concealchar = "𝒩" },
        { name = "calO", mathmode = 1, concealchar = "𝒪" },
        { name = "calP", mathmode = 1, concealchar = "𝒫" },
        { name = "calQ", mathmode = 1, concealchar = "𝒬" },
        { name = "calR", mathmode = 1, concealchar = "ℛ" },
        { name = "calS", mathmode = 1, concealchar = "𝒮" },
        { name = "calT", mathmode = 1, concealchar = "𝒯" },
        { name = "calU", mathmode = 1, concealchar = "𝒰" },
        { name = "calV", mathmode = 1, concealchar = "𝒱" },
        { name = "calW", mathmode = 1, concealchar = "𝒲" },
        { name = "calX", mathmode = 1, concealchar = "𝒳" },
        { name = "calY", mathmode = 1, concealchar = "𝒴" },
        { name = "calZ", mathmode = 1, concealchar = "𝒵" },
        { name = "frA", mathmode = 1, concealchar = "𝔄" },
        { name = "frB", mathmode = 1, concealchar = "𝔅" },
        { name = "frC", mathmode = 1, concealchar = "ℭ" },
        { name = "frD", mathmode = 1, concealchar = "𝔇" },
        { name = "frE", mathmode = 1, concealchar = "𝔈" },
        { name = "frF", mathmode = 1, concealchar = "𝔉" },
        { name = "frG", mathmode = 1, concealchar = "𝔊" },
        { name = "frH", mathmode = 1, concealchar = "ℌ" },
        { name = "frI", mathmode = 1, concealchar = "ℑ" },
        { name = "frJ", mathmode = 1, concealchar = "𝔍" },
        { name = "frK", mathmode = 1, concealchar = "𝔎" },
        { name = "frL", mathmode = 1, concealchar = "𝔏" },
        { name = "frM", mathmode = 1, concealchar = "𝔐" },
        { name = "frN", mathmode = 1, concealchar = "𝔑" },
        { name = "frO", mathmode = 1, concealchar = "𝔒" },
        { name = "frP", mathmode = 1, concealchar = "𝔓" },
        { name = "frQ", mathmode = 1, concealchar = "𝔔" },
        { name = "frR", mathmode = 1, concealchar = "ℜ" },
        { name = "frS", mathmode = 1, concealchar = "𝔖" },
        { name = "frT", mathmode = 1, concealchar = "𝔗" },
        { name = "frU", mathmode = 1, concealchar = "𝔘" },
        { name = "frV", mathmode = 1, concealchar = "𝔙" },
        { name = "frW", mathmode = 1, concealchar = "𝔚" },
        { name = "frX", mathmode = 1, concealchar = "𝔛" },
        { name = "frY", mathmode = 1, concealchar = "𝔜" },
        { name = "frZ", mathmode = 1, concealchar = "ℨ" },

        -- JetBrains fonts mix up boxtimes and boxplus
        { name = "boxplus", mathmode = 1, concealchar = "⊠" },
        { name = "boxtimes", mathmode = 1, concealchar = "⊞" },

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

        -- Text commands
        { name = "S", conceal = 1, concealchar = "§" },
        { name = "hyph", cmdre = "-", conceal = 1 },
        { name = "dash", cmdre = "\\=/", conceal = 1, concealchar = "-" },

        -- Misc
        { name = "smash", conceal = 1 },
        { name = "smash", mathmode = 1, conceal = 1 },
        { name = "newline", cmdre = "\\\\", concealchar = "󰌑" },
        { name = "newline", cmdre = "\\\\", mathmode = 1, concealchar = "󰌑" },
      }

      vim.g.vimtex_syntax_custom_cmds_with_concealed_delims = {
      }

      -- For defaults, see https://github.com/lervag/vimtex/blob/master/autoload/vimtex/options.vim
      vim.g.vimtex_imaps_list = {
        { lhs = "ve", rhs = "\\varepsilon" },
        { lhs = "vt", rhs = "\\vartheta" },
        { lhs = "vp", rhs = "\\varpi" },
        { lhs = "vr", rhs = "\\varrho" },
        { lhs = "vs", rhs = "\\varsigma" },
        { lhs = "vf", rhs = "\\varphi" },
        { lhs = "lla", rhs = "\\longleftarrow" },
        { lhs = "lra", rhs = "\\longrightarrow" },
        { lhs = "lmt", rhs = "\\longmapsto" },
        { lhs = "b", rhs = "vimtex#imaps#style_math('mathbb')", expr = 1 },
        { lhs = "c", rhs = "vimtex#imaps#style_math('mathcal')", expr = 1 },
        { lhs = "f", rhs = "vimtex#imaps#style_math('mathfrak')", expr = 1 },
        { lhs = "r", rhs = "'\\mathrm{' . input('Wrap in \\mathrm: ') . '}'", expr = 1, wrapper = "vimtex#imaps#wrap_trivial" },
        { lhs = "s", rhs = "'\\mathsf{' . input('Wrap in \\mathsf: ') . '}'", expr = 1, wrapper = "vimtex#imaps#wrap_trivial" },
        { lhs = "o", rhs = "'\\operatorname{' . input('Wrap in \\operatorname: ') . '}'", expr = 1, wrapper = "vimtex#imaps#wrap_trivial" },
        { lhs = "O", rhs = "'\\operatornamewithlimits{' . input('Wrap in \\operatornamewithlimits: ') . '}'", expr = 1, wrapper = "vimtex#imaps#wrap_trivial" },
      }
    end,
  },
  {
    "micangl/cmp-vimtex",
    config = function()
      require("cmp").setup.filetype("tex", {
        sources = {
          { name = "vimtex" },
          { name = "luasnip" },
          { name = "buffer" },
        },
      })
    end,
  },
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      highlights = {
        init = { -- this table overrides highlights in all themes
          DevIconTex = { fg = "#3F8CEA" },
        },
        astrolight = {
          Conceal = { fg = "#0060A8" },

          texConcealedArg = { fg = "#4F4F4F" },

          texMathArg = { fg = "#408020" },
          texMathDelim = { fg = "#408020" },
          texMathOper = { fg = "#408020" },
          texMathSub = { fg = "#408020" },
          texMathSuper = { fg = "#408020" },
          texMathSuperSub = { fg = "#408020" },
          texMathZone = { fg = "#408020" },

          texPartArgTitle = { fg = "#4F4F4F", bold = true },
          texTitleArg = { fg = "#4F4F4F", bold = true },

          bibType = { fg = "#0060A8" },
          texCmd = { fg = "#0060A8" },
          texDelim = { fg = "#0060A8" },
          texMathSymbol = { fg = "#0060A8" },

          texCmdPart = { fg = "#0060A8", bold = true },

          texEnvArgName = { fg = "#D66C00" },
          texMathEnvArgName = { fg = "#D66C00" },

          bibKey = { fg = "#A01090" },
          texRefArg = { fg = "#A01090" },

          bibEntryKw = { fg = "#408020" },
          bibVariable = { fg = "#408020", italic = true },
        },
        astrodark = {
          Conceal = { fg = "#51A0CF" },

          texConcealedArg = { fg = "#ADB0BB" },

          texMathArg = { fg = "#82B85B" },
          texMathDelim = { fg = "#82B85B" },
          texMathOper = { fg = "#82B85B" },
          texMathSub = { fg = "#82B85B" },
          texMathSuper = { fg = "#82B85B" },
          texMathSuperSub = { fg = "#82B85B" },
          texMathZone = { fg = "#82B85B" },

          texPartArgTitle = { fg = "#ADB0BB", bold = true },
          texTitleArg = { fg = "#ADB0BB", bold = true },

          bibType = { fg = "#51A0CF" },
          texCmd = { fg = "#51A0CF" },
          texDelim = { fg = "#51A0CF" },
          texMathSymbol = { fg = "#51A0CF" },

          texCmdPart = { fg = "#51A0CF", bold = true },

          texEnvArgName = { fg = "#D4A323" },
          texMathEnvArgName = { fg = "#D4A323" },

          bibKey = { fg = "#D18FE4" },
          texRefArg = { fg = "#D18FE4" },

          bibEntryKw = { fg = "#82B85B" },
          bibVariable = { fg = "#82B85B", italic = true },
        },
      },
    },
  },
  {
    "AstroNvim/astrocore",
    opts = {
      autocmds = {
        mappings = {
          {
            event = "FileType",
            pattern = "tex",
            callback = function()
              vim.keymap.set("n", "<LocalLeader>ll", "<plug>(vimtex-compile)", { noremap = true, silent = true, desc = "Compile LaTeX" })
              vim.keymap.set("n", "<LocalLeader>lv", "<plug>(vimtex-view)", { noremap = true, silent = true, desc = "View PDF" })
              vim.keymap.set("n", "<LocalLeader>lt", "<plug>(vimtex-toc-open)", { noremap = true, silent = true, desc = "Open table of contents" })
              vim.keymap.set("n", "<LocalLeader>lT", "<plug>(vimtex-toc-toggle)", { noremap = true, silent = true, desc = "Toggle table of contents" })
              vim.keymap.set("n", "<LocalLeader>lc", "<plug>(vimtex-clean)", { noremap = true, silent = true, desc = "Clean auxiliary files" })
              vim.keymap.set("n", "<LocalLeader>lC", "<plug>(vimtex-clean-full)", { noremap = true, silent = true, desc = "Clean auxiliary, output files" })
              vim.keymap.set("n", "<LocalLeader>lk", "<plug>(vimtex-stop)", { noremap = true, silent = true, desc = "Stop compilation" })
              vim.keymap.set("n", "<LocalLeader>lK", "<plug>(vimtex-stop-all)", { noremap = true, silent = true, desc = "Stop all compilations" })
              vim.keymap.set("n", "<LocalLeader>lm", "<plug>(vimtex-imaps-list)", { noremap = true, silent = true, desc = "List LaTeX mappings" })
              vim.keymap.set("n", "<LocalLeader>lo", "<plug>(vimtex-compile-output)", { noremap = true, silent = true, desc = "Show output" })

              vim.keymap.set("n", "ts$", "<plug>(vimtex-env-toggle-math)", { noremap = true, silent = true, desc = "Toggle $ ... $ and \\[ ... \\]" })

              require("nvim-surround").buffer_setup {
                surrounds = {
                  c = {
                    add = function ()
                      local config = require("nvim-surround.config")
                      local result = config.get_input("Surround with command: ")
                      if result then
                        return { { "\\" .. result .. "{" }, { "}" } }
                      end
                    end,
                  },
                  e = {
                    add = function ()
                      local config = require("nvim-surround.config")
                      local result = config.get_input("Surround with environment: ")
                      if result then
                        if string.find(result, " ") then
                          local first, rest = string.match(result, "(%S+)%s+(.+)")
                          return {
                            { "\\begin{" .. first .. "}[" .. rest .. "]" },
                            { "\\end{" .. first .. "}" }
                          }
                        else
                          return { { "\\begin{" .. result .. "}" }, {"\\end{" .. result .. "}" } }
                        end
                      end
                    end,
                  },
                  S = {
                    add = { "\\smash{", "}" },
                  },
                },
              }
            end,
          },
        },
      },
    },
  },
}
