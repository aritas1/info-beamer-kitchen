#!/bin/bash

CONFIG_FILE=main.conf

if [[ -f $CONFIG_FILE ]]; then
        . $CONFIG_FILE
else
   echo "main.conf not found! Run commands from the directory where main.conf is"
   exit
fi

rsync --delete -ruv --include='*.jpg' --exclude='*' $PHOTO_FILE_PATH/ $INFOBEAMER_CWD/kitchen_cycler/photos/ --backup-dir=/tmp
