if not vim.env.WSL_DISTRO_NAME then
  return
end

return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    options = {
      opt = {
        -- disable clipboard to avoid extremely high start-up time
        clipboard = "",
      },
      g = {
        clipboard = {
          name = "win32yank-wsl",
          copy = {
            ["+"] = "win32yank.exe -i --crlf",
            ["*"] = "win32yank.exe -i --crlf",
          },
          paste = {
            ["+"] = "win32yank.exe -o --lf",
            ["*"] = "win32yank.exe -o --lf",
          },
        },
      },
    },
  },
}
