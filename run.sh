#!/bin/bash

CONFIG_FILE=main.conf

if [[ -f $CONFIG_FILE ]]; then
        . $CONFIG_FILE
fi

# kill all pssible running programs
killall weather_updater.sh > /dev/null 2>&1
killall info-beamer > /dev/null 2>&1
killall scanner.jar > /dev/null 2>&1

echo "<<<<<<<<<<<<<<<<<<STARTING INFOBEAMER>>>>>>>>>>>>>>>>>>>"


# start infobeamer
 if [ $FULLSCREEN = "1" ]; then
   INFOBEAMER_FULLSCREEN=1 ../info-beamer/info-beamer ./kitchen_cycler/ > /dev/null 2>&1 &
 else
    ../info-beamer/info-beamer ./kitchen_cycler/ > /dev/null 2>&1 &
 fi

# start the weather / clock updater
./helper/weather_updater.sh > /dev/null 2>&1 &

# start the scanner
$INFOBEAMER_CWD/scanner/scanner.jar $INFOBEAMER_CWD/scanner/ scan_collector > /dev/null 2>&1 &
