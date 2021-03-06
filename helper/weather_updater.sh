#!/bin/bash

CONFIG_FILE=main.conf

if [[ -f $CONFIG_FILE ]]; then
        . $CONFIG_FILE
else
   echo "main.conf not found! Run commands from the directory where main.conf is located."
   exit
fi

SUBDIR="kitchen_cycler/weather"
FORECASTDIR="kitchen_cycler/weatherforecast"

ABSDIR=$INFOBEAMER_CWD/$SUBDIR
TMP=$ABSDIR/tmp

while :
do
 wget $WEATHER -t $WGET_TRIES --connect-timeout=$WGET_TIMEOUT --read-timeout=$WGET_TIMEOUT -O $TMP #> /dev/null 2>&1
 mv $TMP $ABSDIR/current
 echo "[`date`] got current"
 wget $FORECAST -t $WGET_TRIES --connect-timeout=$WGET_TIMEOUT --read-timeout=$WGET_TIMEOUT -O $TMP #> /dev/null 2>&1
 mv $TMP $INFOBEAMER_CWD/$FORECASTDIR/forecast
 echo "[`date`] got forecast"
 wget $WEATHERCAM -t $WGET_TRIES --connect-timeout=$WGET_TIMEOUT --read-timeout=$WGET_TIMEOUT -O $TMP #>/dev/null 2>&1
 weathersize=`stat -c %s $TMP`
 if [ $weathersize -gt 0 ]
 then
  echo "move weather pic, size was $weathersize"
  cp $TMP $INFOBEAMER_CWD/$FORECASTDIR/weather_background.jpg  
  touch $INFOBEAMER_CWD/$FORECASTDIR/weather_background.jpg
  mv $TMP $ABSDIR/weather_background.jpg
  touch $ABSDIR/weather_background.jpg
 fi
 echo "[`date`] got weathercam pic"
 java -cp $INFOBEAMER_CWD/helper/ Clock kitchen_cycler/weather/analogclock/ debug
 echo "[`date`] set clock"
 sleep 120
done
