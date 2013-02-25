#!/bin/bash

CONFIG_FILE=main.conf

if [[ -f $CONFIG_FILE ]]; then
        . $CONFIG_FILE
fi

# kill all pssible running programs
./stop.sh


touch $INFOBEAMER_CWD/log/info-beamer
touch $INFOBEAMER_CWD/log/scanner
touch $INFOBEAMER_CWD/log/weather_updater
touch $INFOBEAMER_CWD/log/photo_syn
touch $INFOBEAMER_CWD/log/analogclock_updater
touch $INFOBEAMER_CWD/log/statistics


echo "[`date`] Start logging" > $INFOBEAMER_CWD/log/info-beamer
echo "[`date`] Start logging" > $INFOBEAMER_CWD/log/scanner
echo "[`date`] Start logging" > $INFOBEAMER_CWD/log/weather_updater
echo "[`date`] Start logging" > $INFOBEAMER_CWD/log/photo_syn
echo "[`date`] Start logging" > $INFOBEAMER_CWD/log/analogclock_updater
echo "[`date`] Start logging" > $INFOBEAMER_CWD/log/statistics

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

# start photo sync helper
./helper/photo_syn.sh > $INFOBEAMER_CWD/log/photo_syn 2>&1 &

# start the scanner
java -jar $INFOBEAMER_CWD/scanner/scanner.jar $INFOBEAMER_CWD/scanner/ scan_collector > $INFOBEAMER_CWD/log/scanner 2>&1 &


# start clock updater
./helper/analogclock_updater.sh > $INFOBEAMER_CWD/log/analogclock_updater 2>&1 &

#start simpleefa updater
./helper/simpleefa-connections.sh > $INFOBEAMER_CWD/log/simpleefa_updater 2>&1 &

#start statistics updater
./helper/statistics_updater.sh > $INFOBEAMER_CWD/log/statistics 2>&1 &

