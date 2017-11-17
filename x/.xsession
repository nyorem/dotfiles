#! /bin/sh

# Japanese input method
## uim
# export GTK_IM_MODULE='uim'
# export QT_IM_MODULE='uim'
# uim-xim &
# export XMODIFIERS='@im=uim'
# uim-toolbar-gtk &

## ibus
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drx
