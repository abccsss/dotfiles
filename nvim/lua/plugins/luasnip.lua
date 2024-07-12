return {
  "L3MON4D3/LuaSnip",
  config = function(plugin, opts)
    -- -- astrovim defaults
    -- require("astronvim.plugins.configs.luasnip")(plugin, opts)

    -- load snippets paths
    require("luasnip.loaders.from_vscode").lazy_load({
      paths = { vim.fn.stdpath("config") .. "/snippets" },
    })

    -- use Tab and Shift-Tab to navigate through tabstops
    vim.cmd[[
      imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : copilot#Accept("\<CR>") 
      smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

      imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
      smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
    ]]
  end,
}
