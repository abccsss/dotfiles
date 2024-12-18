local function create_latex_autocmd()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "bib", "tex" },
    callback = function()
      vim.bo.tabstop = 4
      vim.bo.shiftwidth = 4

      -- Add custom key maps
      local wk = require("which-key")
      local latex_icon = {
        icon = "",
        hl = "MiniIconsAzure",
      }

      wk.add({
        {
          buffer = 0,
          icon = latex_icon,
          { "<leader>l", group = "VimTeX" },
          { "<leader>lc", "<plug>(vimtex-clean)", desc = "Clean auxiliary files" },
          { "<leader>lC", "<plug>(vimtex-clean-full)", desc = "Clean auxiliary, output files" },
          { "<leader>le", "<plug>(vimtex-errors)", desc = "Show errors" },
          { "<leader>lg", "<plug>(vimtex-status)", desc = "VimTex status" },
          { "<leader>lk", "<plug>(vimtex-stop)", desc = "Stop compilation" },
          { "<leader>ll", "<plug>(vimtex-compile)", desc = "Compile LaTeX" },
          { "<leader>lt", "<plug>(vimtex-toc-open)", desc = "Open table of contents" },
          { "<leader>lT", "<plug>(vimtex-toc-toggle)", desc = "Toggle table of contents" },
          { "<leader>lv", "<plug>(vimtex-view)", desc = "View LaTeX PDF" },
        },
        {
          buffer = 0,
          icon = latex_icon,
          mode = { "n", "x" },
          { "<f5>", "<plug>(vimtex-compile)", desc = "Compile LaTeX" },
          { "<f6>", "<plug>(vimtex-view)", desc = "View LaTeX PDF" },
        },
      })

      if vim.bo.filetype == "tex" then
        wk.add({
          {
            buffer = 0,
            icon = latex_icon,
            mode = { "n", "x", "o" },
            { "[[", "<plug>(vimtex-[[)", desc = "Prev section" },
            { "[]", "<plug>(vimtex-[])", desc = "Prev end of section" },
            { "[m", "<plug>(vimtex-[m)", desc = "Prev environment" },
            { "[M", "<plug>(vimtex-[M)", desc = "Prev end of environment" },
            { "[n", "<plug>(vimtex-[n)", desc = "Prev formula" },
            { "[N", "<plug>(vimtex-[N)", desc = "Prev end of formula" },
            { "][", "<plug>(vimtex-][)", desc = "Next end of section" },
            { "]]", "<plug>(vimtex-]])", desc = "Next section" },
            { "]m", "<plug>(vimtex-]m)", desc = "Next environment" },
            { "]M", "<plug>(vimtex-]M)", desc = "Next end of environment" },
            { "]n", "<plug>(vimtex-]n)", desc = "Prev formula" },
            { "]N", "<plug>(vimtex-]N)", desc = "Prev end of formula" },
          },
        })
      end

      -- Insert mode mappings
      local function read_key_and_wrap(command)
        local key = vim.fn.getchar()
        if key == 0 then
          return
        end
        vim.api.nvim_input(command .. "{" .. vim.fn.nr2char(key) .. "}")
      end

      local function read_string_and_wrap(command)
        local str = vim.fn.input("Wrap with " .. command .. ": ")
        if str == "" then
          return
        end
        vim.api.nvim_input(command .. "{" .. str .. "}")
      end

      local function insert_env(env)
        vim.api.nvim_input("\\begin{" .. env .. "}" .. "<CR>" .. "\\end{" .. env .. "}<C-o>O")
      end

      wk.add({
        {
          buffer = 0,
          icon = latex_icon,
          mode = "n",
          -- d+, d- to cycle through \big, \Big, \bigg, \Bigg (default: tsd, tsD)
          { "d-", "<plug>(vimtex-delim-toggle-modifier-reverse)" },
          { "d+", "<plug>(vimtex-delim-toggle-modifier)" },
          { "d=", "<plug>(vimtex-delim-toggle-modifier)" },
          -- ]j, [j to jump to unindented environment
          { "]j", "/^\\\\begin{<CR>:noh<CR>", desc = "Next unindented \\begin" },
          { "[j", "?^\\\\begin{<CR>:noh<CR>", desc = "Prev unindented \\begin" },
          { "]J", "/^\\\\end{<CR>:noh<CR>", desc = "Next unindented \\end" },
          { "[J", "?^\\\\end{<CR>:noh<CR>", desc = "Prev unindented \\end" },
        },
        {
          buffer = 0,
          mode = "i",
          -- <C-]> to jump to next argument; note <C-[> is <Esc>, can't be remapped
          { "<C-]>", "<Esc>]}/{<CR>:noh<CR>a" },
          { ";;", "\\colon" },
          { ";{", "\\{ \\}<C-o>B<Left> " },
          { ";|", "\\lVert \\rVert<C-o>B<Left> " },
          { ";a", "\\alpha" },
          { ";ab", "\\lvert \\rvert<C-o>B<Left> " },
          { ";al", "\\aleph" },
          { ";am", "\\amalg" },
          { ";an", "\\langle \\rangle<C-o>B<Left> " },
          { ";ap", "\\approx" },
          { ";b", "\\beta" },
          { ";ba", "\\big" },
          { ";bb", "\\Big" },
          { ";bc", "\\bigg" },
          { ";bd", "\\Bigg" },
          { ";be", "\\beth" },
          { ";bi", "\\binom" },
          { ";bo", "\\bot" },
          { ";bp", "\\boxplus" },
          { ";br", "\\breve{}<Left>" },
          { ";bt", "\\boxtimes" },
          { ";bu", "\\bullet" },
          {
            ";B",
            function()
              read_key_and_wrap("\\mathbb")
            end,
          },
          { ";c", "\\chi" },
          { ";ca", "\\curvearrowright" },
          { ";cal", "\\curvearrowleft" },
          { ";car", "\\curvearrowright" },
          { ";cc", "\\circledcirc" },
          { ";cd", "\\cdot" },
          { ";cdd", "\\cdots" },
          { ";ce", "\\lceil \\rceil<C-o>B<Left> " },
          { ";ch", "\\check" },
          { ";ci", "\\circ" },
          { ";co", "\\cong" },
          { ";cp", "\\coprod" },
          { ";cr", "\\cref" },
          {
            ";C",
            function()
              read_key_and_wrap("\\mathcal")
            end,
          },
          { ";d", "\\delta" },
          { ";da", "\\downarrow" },
          { ";db", "\\dotsb" },
          { ";dc", "\\dotsc" },
          { ";dg", "\\dagger" },
          { ";di", "\\diamond" },
          { ";dl", "\\dashleftarrow" },
          { ";dm", "\\dotsm" },
          { ";dr", "\\dashrightarrow" },
          { ";dv", "\\dashv" },
          { ";D", "\\Delta" },
          { ";Da", "\\Downarrow" },
          { ";Dg", "\\ddagger" },
          { ";e", "\\epsilon" },
          { ";el", "\\ell" },
          { ";em", "\\varnothing" },
          { ";eq", "\\equiv" },
          { ";ex", "\\exists" },
          { ";E", "\\emph{}<Left>" },
          { ";f", "\\phi" },
          { ";fa", "\\forall" },
          { ";fb", "\\flat" },
          { ";ff", "\\frac{}{}<Left><Left><Left>" },
          { ";fl", "\\lfloor \\rfloor<C-o>B<Left> " },
          { ";F", "\\Phi" },
          { ";FF", "\\frac<CR><Tab>{}<C-o>O<Tab>{}<Left>" },
          { ";g", "\\gamma" },
          { ";ge", "\\geq" },
          { ";G", "\\Gamma" },
          { ";h", "\\eta" },
          { ";ha", "\\hat{}<Left>" },
          { ";hb", "\\hbar" },
          { ";he", "\\heartsuit" },
          { ";hl", "\\hookleftarrow" },
          { ";hr", "\\hookrightarrow" },
          { ";hs", "\\hslash" },
          { ";i", "\\iota" },
          { ";if", "\\infty" },
          { ";im", "\\imath" },
          { ";in", "\\in" },
          { ";I", "\\int" },
          { ";II", "\\iint" },
          { ";III", "\\iiint" },
          { ";j", "\\theta" },
          { ";jm", "\\jmath" },
          { ";J", "\\Theta" },
          { ";k", "\\kappa" },
          { ";l", "\\lambda" },
          { ";la", "\\leftarrow" },
          { ";lb", "\\label{}<Left>" },
          { ";le", "\\leq" },
          { ";li", "\\limits" },
          { ";ll", "\\longleftarrow" },
          { ";llc", "\\llcorner" },
          { ";llr", "\\longleftrightarrow" },
          { ";lm", "\\longmapsto" },
          { ";lr", "\\longrightarrow" },
          { ";lrc", "\\lrcorner" },
          { ";lt", "\\ltimes" },
          { ";L", "\\Lambda" },
          { ";La", "\\Leftarrow" },
          { ";Ll", "\\Longleftarrow" },
          { ";Llr", "\\Longleftrightarrow" },
          { ";Lr", "\\Longrightarrow" },
          { ";m", "\\mu" },
          { ";mh", "\\mho" },
          { ";mi", "\\mid" },
          { ";mp", "\\mp" },
          { ";mt", "\\mapsto" },
          { ";n", "\\nu" },
          { ";na", "\\nabla" },
          { ";nb", "\\natural" },
          { ";ne", "\\neq" },
          { ";ng", "\\neg" },
          { ";ni", "\\ni" },
          { ";nin", "\\notin" },
          { ";nn", "\\cap" },
          { ";nni", "\\notni" },
          { ";no", "\\not" },
          { ";ns", "\\nsim" },
          { ";NN", "\\bigcap" },
          { ";od", "\\odot" },
          { ";ol", "\\overline{}<Left>" },
          { ";op", "\\oplus" },
          { ";os", "\\overset{}{}<Left><Left><Left>" },
          { ";ot", "\\otimes" },
          { ";OI", "\\oint" },
          { ";OP", "\\bigoplus" },
          { ";OT", "\\bigotimes" },
          { ";p", "\\pi" },
          { ";pa", "\\partial" },
          { ";pe", "\\perp" },
          { ";pm", "\\pm" },
          { ";ps", "\\psi" },
          { ";P", "\\Pi" },
          { ";PP", "\\prod" },
          { ";Ps", "\\Psi" },
          { ";qn", "\\sqcap" },
          { ";qs", "\\sqsubset" },
          { ";qse", "\\sqsubseteq" },
          { ";qS", "\\sqsupset" },
          { ";qSe", "\\sqsupseteq" },
          { ";qu", "\\sqcup" },
          { ";QN", "\\bigsqcap" },
          { ";QU", "\\bigsqcup" },
          { ";r", "\\rho" },
          { ";ra", "\\rightarrow" },
          { ";rr", "\\rightrightarrows" },
          { ";rt", "\\rtimes" },
          { ";Ra", "\\Rightarrow" },
          { ";s", "\\sigma" },
          { ";se", "\\simeq" },
          { ";sh", "\\sharp" },
          { ";si", "\\sim" },
          { ";sk", "\\substack" },
          { ";sm", "\\setminus" },
          { ";sr", "\\sqrt" },
          { ";ss", "\\subset" },
          { ";sse", "\\subseteq" },
          { ";ss=", "\\subseteqq" },
          { ";st", "\\star" },
          { ";s=", "\\cong" },
          { ";S", "\\Sigma" },
          { ";Ss", "\\supset" },
          { ";Sse", "\\supseteq" },
          { ";Ss=", "\\supseteqq" },
          { ";SS", "\\sum" },
          { ";t", "\\tau" },
          { ";thl", "\\twoheadleftarrow" },
          { ";thr", "\\twoheadrightarrow" },
          { ";ti", "\\tilde{}<Left>" },
          { ";to", "\\to" },
          { ";tp", "\\top" },
          { ";T", "\\times" },
          { ";ua", "\\uparrow" },
          { ";ub", "\\underbrace{}<Left>" },
          { ";ul", "\\underline{}<Left>" },
          { ";ulc", "\\ulcorner" },
          { ";urc", "\\urcorner" },
          { ";us", "\\underset{}{}<Left><Left><Left>" },
          { ";uu", "\\cup" },
          {
            ";U",
            function()
              read_key_and_wrap("\\mathrm")
            end,
          },
          { ";Ua", "\\Uparrow" },
          { ";UU", "\\bigcup" },
          { ";vd", "\\vdash" },
          { ";vD", "\\vDash" },
          { ";ve", "\\varepsilon" },
          { ";vf", "\\varphi" },
          { ";vj", "\\vartheta" },
          { ";vk", "\\varkappa" },
          { ";vn", "\\varnothing" },
          { ";vp", "\\varpi" },
          { ";vr", "\\varrho" },
          { ";vs", "\\varsigma" },
          { ";vv", "\\vee" },
          { ";Vd", "\\Vdash" },
          { ";VV", "\\bigvee" },
          { ";w", "\\omega" },
          { ";wp", "\\wp" },
          { ";ww", "\\wedge" },
          { ";W", "\\Omega" },
          { ";WW", "\\bigwedge" },
          { ";x", "\\xi" },
          { ";X", "\\Xi" },
          { ";y", "\\upsilon" },
          { ";Y", "\\Upsilon" },
          { ";z", "\\zeta" },
          {
            "'o",
            function()
              read_string_and_wrap("\\operatorname")
            end,
          },
          {
            "'O",
            function()
              read_string_and_wrap("\\operatornamewithlimits")
            end,
          },
          {
            "'r",
            function()
              read_string_and_wrap("\\mathrm")
            end,
          },
          {
            "'s",
            function()
              read_string_and_wrap("\\mathsf")
            end,
          },
          {
            '"a',
            function()
              insert_env("align")
            end,
          },
          {
            '"A',
            function()
              insert_env("align*")
            end,
          },
          {
            '"c',
            function()
              insert_env("cases")
            end,
          },
          {
            '"e',
            function()
              insert_env("equation")
            end,
          },
          {
            '"E',
            function()
              insert_env("equation*")
            end,
          },
        },
      })

      -- Add surrounds
      require("nvim-surround").buffer_setup({
        surrounds = {
          ["\\"] = {
            add = function()
              local config = require("nvim-surround.config")
              local result = config.get_input("Surround with command: \\")
              if result then
                return { { "\\" .. result .. "{" }, { "}" } }
              end
            end,
          },
          e = {
            add = function()
              local config = require("nvim-surround.config")
              local result = config.get_input("Surround with environment: ")
              if result then
                if string.find(result, " ") then
                  local first, rest = string.match(result, "(%S+)%s+(.+)")
                  return {
                    { "\\begin{" .. first .. "}[" .. rest .. "]" },
                    { "\\end{" .. first .. "}" },
                  }
                else
                  return { { "\\begin{" .. result .. "}" }, { "\\end{" .. result .. "}" } }
                end
              end
            end,
          },
          S = {
            add = { "\\smash{", "}" },
          },
        },
      })
    end,
  })
end

return {
  {
    "lervag/vimtex",
    lazy = false,
    config = function()
      -- PDF viewer
      -- Need the following line in sioyek config:
      --   vimtex_wsl_fix 1
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

      vim.g.vimtex_delim_toggle_mod_list = {
        { "\\bigl", "\\bigr" },
        { "\\Bigl", "\\Bigr" },
        { "\\biggl", "\\biggr" },
        { "\\Biggl", "\\Biggr" },
        { "\\left", "\\right" },
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
        { name = "italcorr", cmdre = "/", conceal = 1 },
        { name = "dash", cmdre = "\\=/", conceal = 1, concealchar = "-" },

        -- Misc
        { name = "limits", mathmode = 1, conceal = 1 },
        { name = "smash", conceal = 1 },
        { name = "smash", mathmode = 1, conceal = 1 },
        { name = "newline", cmdre = "\\\\", concealchar = "󰌑" },
        { name = "newline", cmdre = "\\\\", mathmode = 1, concealchar = "󰌑" },
      }

      vim.g.vimtex_syntax_custom_cmds_with_concealed_delims = {}

      create_latex_autocmd()
    end,
  },
  {
    -- Disable formatting for bibtex
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft.bib = {}
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "bibtex")
      table.insert(opts.ensure_installed, "latex")

      -- Disable treesitter highlighting for LaTeX
      opts.highlight = {
        enable = true,
        disable = { "latex" },
      }
    end,
  },
}
