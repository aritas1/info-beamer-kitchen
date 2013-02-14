#!/bin/bash

CONFIG_FILE=main.conf

if [[ -f $CONFIG_FILE ]]; then
        . $CONFIG_FILE
fi

# kill all pssible running programs
killall weather_updater.sh > /dev/null 2>&1
killall info-beamer > /dev/null 2>&1
killall scanner.jar > /dev/null 2>&1


touch $INFOBEAMER_CWD/log/info-beamer
touch $INFOBEAMER_CWD/log/scanner
touch $INFOBEAMER_CWD/log/weather_updater


echo "[`date`] Start logging" > $INFOBEAMER_CWD/log/info-beamer
echo "[`date`] Start logging" > $INFOBEAMER_CWD/log/scanner
echo "[`date`] Start logging" > $INFOBEAMER_CWD/log/weather_updater

echo "<<<<<<<<<<<<<<<<<<STARTING INFOBEAMER>>>>>>>>>>>>>>>>>>>"


# start infobeamer
export DISPLAY=:0
 if [ $FULLSCREEN = "1" ]; then
   INFOBEAMER_FULLSCREEN=1 ../info-beamer/info-beamer ./kitchen_cycler/ > $INFOBEAMER_CWD/log/info-beamer 2>&1 &
 else
    ../info-beamer/info-beamer ./kitchen_cycler/ > $INFOBEAMER_CWD/log/info-beamer 2>&1 &
 fi

# start the weather / clock updater
./helper/weather_updater.sh > $INFOBEAMER_CWD/log/weather_updater 2>&1 &

# start the scanner
java -jar $INFOBEAMER_CWD/scanner/scanner.jar $INFOBEAMER_CWD/scanner/ scan_collector > $INFOBEAMER_CWD/log/scanner 2>&1 &
