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
- keyremap4macbook : keyboard behaviour customisation

### Others
- dircolors : dircolors files (molokai, solarized and original) for OSX
- bin : personal binaries
- offlineimaprc / msmtprc / urlview / mutt : mutt configuration (see [here](http://stevelosh.com/blog/2012/10/the-homely-mutt/))
- tmux.conf : tmux config
- rcrc / hooks : rcm config

-----

## HOW TO INSTALL :

- Dependencies : `brew tap mike-burns/rcm && brew install rcm` on OSX
- Clone : `cd && git clone https://github.com/nyorem/dotfiles`
- Symlink : `rcup -d dotfiles -x "README.md bin iterm dircolors" -v`

