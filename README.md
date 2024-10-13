# My dotfiles

## What's included?

- arch: Archlinux specific configuration files
- bash
- bin: some scripts I use sometimes
- browsers: `vimperator`, `pentadactyl` and my startpage
- dircolors: colored ls (molokai, original and solarized)
- emacs: [spacemacs](http://github.com/syl20bnr/spacemacs)
- fish
- gdb
- ghc: hoogle commands for`ghci`
- gpg
- [hydra](https://github.com/sdegutis/hydra)
- i3: `i3` and `i3blocks`
- [iterm](http://www.iterm2.com): some colorschemes (molokai, solarized and tomorrow)
- [keyremap4macbook](https://pqrs.org/macosx/keyremap4macbook/)
- latex: `latexmk` config.
- lf
- media: `mpd`, `ncmpcpp` and `mpv`.
- mutt: see [here](http://stevelosh.com/blog/2012/10/the-homely-mutt/)
- python
- [slate](https://github.com/jigish/slate)
- terminator
- tmux
- [todotxt](http://todotxt.com/)
- vcs: `git` and `hg`
- x: `Xorg`, `urxvt`
- xmonad: `xmonad` and `xmobar`

See:
- [dotvim](https://github.com/nyorem/dotvim) for my `vim` configuration
- [dotnvim](https://github.com/nyorem/dotnvim) for my `neovim` configuration
- [prezto](https://github.com/nyorem/prezto) for the `zsh` one.

## How to install?

- Dependencies:
    - `stow`:
        - on OSX with `Homebrew`: `brew install stow`
        - on Ubuntu derivatives: `sudo apt-get install stow`
    - for the `bash` configuration:
        - [ripgrep](https://github.com/BurntSushi/ripgrep): `ripgrep` package on Ubuntu
        - [fzf](https://github.com/junegunn/fzf): grab the latest [binary release](https://github.com/junegunn/fzf/releases)
        - [fd](https://github.com/sharkdp/fd): `fd-find` package on Ubuntu
        - [zoxide](https://github.com/ajeetdsouza/zoxide): `curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh`
        - [exa](https://github.com/ogham/exa): `exa` package on Ubuntu
        - [lf](https://github.com/gokcehan/lf): I am using [this](https://github.com/vincentpinet/lf) fork
        - [wslu](https://github.com/wslutilities/wslu): `ubuntu-wsl` package on Ubuntu
- Clone : `cd && git clone https://github.com/nyorem/dotfiles`
- Symlink : `cd dotfiles && ./install.sh`

## Tips

### Use the homepage as the new tab page in Firefox

**WARNING**: does not work with Firefox 57+ since extensions does not allow access to local files.

Install the [New Tab Homepage](https://addons.mozilla.org/fr/firefox/addon/new-tab-homepage/) extension.
