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
- media: `mpd`, `ncmpcpp` and `mpv`.
- mutt: see [here](http://stevelosh.com/blog/2012/10/the-homely-mutt/)
- [slate](https://github.com/jigish/slate)
- tmux
- [todotxt](http://todotxt.com/)
- vcs: `git` and `hg`
- x: `Xorg`, `urxvt`
- xmonad: `xmonad` and `xmobar`

See [dotvim](https://github.com/nyorem/dotvim) for my `vim` configuration and
[prezto](https://github.com/nyorem/prezto) for the `zsh` one.

## How to install?

- Dependencies: `stow` (on OSX with `Homebrew`: `brew install stow`)
- Clone : `cd && git clone https://github.com/nyorem/dotfiles`
- Symlink : `cd dotfiles && ./install.sh`

## Tips

### Use the homepage as the new tab page in Firefox

**WARNING**: does not work with Firefox 57+ since extensions does not allow access to local files.

Install the [New Tab Homepage](https://addons.mozilla.org/fr/firefox/addon/new-tab-homepage/) extension.
