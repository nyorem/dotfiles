#! /usr/bin/env bash
# Backup my home folder using rsync.

IGNORELIST="$HOME/bin/ignorelist"
BACKUP_DIR="/run/media/$USER/Backup"

rsync -aP --exclude-from=$IGNORELIST /home/$USER/ $BACKUP_DIR

