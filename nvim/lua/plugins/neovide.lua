if not vim.g.neovide then
  return {} -- do nothing if not in a Neovide session
end

return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      options = {
        g = {
          neovide_theme = "auto",
        },
        o = {
          -- background = "light",
          -- guifont = "Fira Mono,FiraCode Nerd Font,JuliaMono:h12:#h-full",
          guifont = "JetBrainsMono Nerd Font,JuliaMono:h12:#h-full",
        },
      },
    },
  },
}
