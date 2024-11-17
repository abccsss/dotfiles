Config files for [Neovim](https://neovim.io/)
based on the [LazyVim](https://www.lazyvim.org/) configuration.

I use Neovim under WSL 2 on Windows 11,
with the GUI tool [Neovide](https://neovide.dev/).

To use these files, first set up [LazyVim](https://www.lazyvim.org/),
then place the files here in `~/.config/nvim/`.
Extra steps that are required (not exhaustive):

* Install [ripgrep](https://github.com/BurntSushi/ripgrep)
    for live grep to work.

* In Neovim, run `:LazyExtras` to add plugins.

* Install language servers via Mason. Example:
    `:MasonInstall texlab` for LaTeX.

