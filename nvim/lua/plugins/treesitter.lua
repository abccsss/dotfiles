-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",

  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "lua",
      "vim",
      -- add more arguments for adding more treesitter parsers
    })

    opts.highlight = {
      enable = true,

      disable = { "bibtex", "latex" },
    }
  end,

  -- config = function()
  --   -- Extra conceal rules for LaTeX
  --   vim.cmd[[
  --     function! SetupTexConceal()
  --       syntax match texMathCmd "\\=/" conceal cchar=-
  --     endfunction
  --
  --     augroup texConceal
  --       autocmd FileType tex call SetupTexConceal()
  --     augroup END
  --   ]]
  -- end,
}
