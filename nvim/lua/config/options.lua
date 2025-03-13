local is_wsl = vim.fn.has("wsl") == 1

-- my custom options
vim.g.my = {}

vim.o.background = "dark"
vim.o.linebreak = false
vim.o.selectmode = "mouse" -- Enter select mode on mouse
vim.o.spell = true

-- WSL clipboard
if is_wsl then
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
  }
end
