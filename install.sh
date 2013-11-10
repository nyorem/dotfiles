#! /usr/bin/env bash
# Install dotfiles

HERE=$(pwd)

echo "Creating backup directory..."

rm -rfv backup 2> /dev/null
mkdir -v backup

echo "bash_profile"
if [ -f $HOME/.bash_profile ]; then
        mv -v $HOME/.bash_profile $HERE/backup/
fi
ln -s $HERE/bash_profile $HOME/.bash_profile
echo

echo "gitconfig"
if [ -f $HOME/.gitconfig ]; then
        mv -v $HOME/.gitconfig $HERE/backup/
fi
ln -s $HERE/gitconfig $HOME/.gitconfig
echo

echo "tmux.conf"
if [ -f $HOME/.tmux.conf ]; then
        mv -v $HOME/.tmux.conf $HERE/backup/
fi
ln -s $HERE/tmux.conf $HOME/.tmux.conf
echo

echo "slate"
if [ -f $HOME/.slate ]; then
        mv -v $HOME/.slate $HERE/backup/
fi
ln -s $HERE/slate $HOME/.slate
echo

echo "fish"
if [ -d  $HOME/.config/fish ]; then
        mv -v $HOME/.config/fish $HERE/backup/
fi
ln -s $HERE/fish $HOME/.config/fish
echo

echo "offlineimap"
if [ -f $HOME/.offlineimaprc ]; then
        mv -v $HOME/.offlineimaprc $HERE/backup/
fi
ln -s $HERE/mail/offlineimaprc $HOME/.offlineimaprc
echo

echo "urlview"
if [ -f $HOME/.urlview ]; then
        mv -v $HOME/.urlview $HERE/backup/
fi
ln -s $HERE/mail/urlview $HOME/.urlview
echo

echo "msmtp"
if [ -f $HOME/.msmtprc ]; then
        mv -v $HOME/.msmtprc $HERE/backup/
fi
ln -s $HERE/mail/msmtprc $HOME/.msmtprc
echo

echo "mutt"
if [ -d $HOME/.mutt ]; then
        mv -v $HOME/.mutt $HERE/backup/
fi
mkdir -v $HOME/.mutt/alias
mkdir -v $HOME/.mutt/cache
mkdir -v $HOME/.mutt/sig
mkdir -v $HOME/.mutt/temp
ln -s $HERE/mail/view_attachment.sh $HOME/.mutt/view_attachment.sh
ln -s $HERE/mail/offlineimap.py $HOME/.mutt/offlineimap.py
ln -s $HERE/mail/mailcap $HOME/.mutt/mailcap
ln -s $HERE/mail/muttrc $HOME/.mutt/muttrc
ln -s $HERE/mail/Equifax_Secure_CA.cert $HOME/.mutt/Equifax_Secure_CA.cert
ln -s $HERE/mail/colors $HOME/.mutt/colors
echo

