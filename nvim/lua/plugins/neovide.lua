if not vim.g.neovide then
  return {} -- do nothing if not in a Neovide session
end

return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      options = {
        o = {
          -- guifont = "Fira Mono,FiraCode Nerd Font,JuliaMono:h12:#h-full",
          guifont = "JetBrainsMono Nerd Font,JuliaMono:h12:#h-full",
        },
      },
    },
  },
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      colorscheme = "astrolight",
    },
  }
}
