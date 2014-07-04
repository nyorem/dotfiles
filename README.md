# My dotfiles

## What's included ?

### Shells
- `bash` : bash_profile, bashrc
- `fish` : config/fish


### VCS
- `git` : gitconfig
- `hg` : hgrc
- [mr](https://joeyh.name/code/mr/) : mrconfig


### OSX
- [iterm](http://www.iterm2.com) : colors for iTerm2 (tomorrow, solarized and molokai)
- [slate](https://github.com/jigish/slate)
- [hydra](https://github.com/sdegutis/hydra)
- [keyremap4macbook](https://pqrs.org/macosx/keyremap4macbook/)
- `dircolors` : dircolors files (molokai, solarized and original)


### Development
- `bin` : personal scripts
- [tmux](http://tmux.sourceforge.net) : `tmux.conf`, `tmuxline.conf`
- `ghci` : hoogle commands for ghci


### Divers
- rcrc / hooks : [rcm](https://github.com/thoughtbot/rcm) config
- offlineimaprc / msmtprc / urlview / mutt : mutt configuration (see [here](http://stevelosh.com/blog/2012/10/the-homely-mutt/))


### Web
- [pentadactyl](http://5digits.org/pentadactyl/) : `pentadactylrc`


### Other repos
- [vim](https://github.com/nyorem/dotvim)
- [zsh](https://github.com/nyorem/oh-my-zsh)


-----


## HOW TO INSTALL :

- Dependencies : `brew tap thoughtbot/formulae && brew install rcm` on OSX
- Clone : `cd && git clone https://github.com/nyorem/dotfiles`
- Symlink : `rcup -d dotfiles -x "README.md bin iterm dircolors" -v`

