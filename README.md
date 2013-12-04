# My dotfiles

## What's in it ?

### Shell
- bash_profile : bash config
- config/fish : fish config files

### VCS
- gitconfig : git config
- hgrc : hg config

### OSX
- iterm : colors for iTerm2 (tomorrow, solarized and molokai)
- slate : slate config file

### Others
- dircolors : dircolors files (molokai, solarized and original) for OSX
- bin : personal binaries
- offlineimaprc / msmtprc / urlviw / mutt : mutt configuration
- tmux.conf : tmux config
- rcrc / hooks : rcm config

-----

## HOW TO INSTALL :

- Install `rcm` : `brew tap mike-burns/rcm && brew install rcm` on OSX
- Run `cd && git clone https://github.com/nyorem/dotfiles && rcup -d dotfiles -x "README.md bin iterm dircolors" -v`

