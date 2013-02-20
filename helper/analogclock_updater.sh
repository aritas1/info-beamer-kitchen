#!/bin/bash

CONFIG_FILE=main.conf

if [[ -f $CONFIG_FILE ]]; then
        . $CONFIG_FILE
else
   echo "main.conf not found! Run commands from the directory where main.conf is located."
   exit
fi

java -cp $INFOBEAMER_CWD/helper/ Clock kitchen_cycler/analogclock/ debug
echo "[`date`] set clock"
sleep 361
