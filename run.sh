#!/bin/bash

CONFIG_FILE=main.conf

if [[ -f $CONFIG_FILE ]]; then
        . $CONFIG_FILE
fi

export INFOBEAMER_CWD=`pwd`

echo "<<<<<<<<<<<<<<<<<<STARTING INFOBEAMER>>>>>>>>>>>>>>>>>>>"

 if [ $FULLSCREEN = "1" ]; then
   INFOBEAMER_FULLSCREEN=1 ../info-beamer/info-beamer ./kitchen_cycler/ &
 else
    ../info-beamer/info-beamer ./kitchen_cycler/ &
 fi

./run_helpers.sh
