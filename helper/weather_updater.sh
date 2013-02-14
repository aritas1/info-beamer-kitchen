#!/bin/bash

CONFIG_FILE=$INFOBEAMER_CWD/main.conf

echo $CONFIG_FILE
if [[ -f $CONFIG_FILE ]]; then
        . $CONFIG_FILE
fi

SUBDIR="kitchen_cycler/weather"

ABSDIR=$INFOBEAMER_CWD/$SUBDIR
TMP=$ABSDIR/tmp

while :
do
 wget $WEATHER -t $WGET_TRIES --connect-timeout=$WGET_TIMEOUT --read-timeout=$WGET_TIMEOUT -O $TMP #> /dev/null 2>&1
 mv $TMP $ABSDIR/current
 echo "[`date`] got current"
 wget $FORECAST -t $WGET_TRIES --connect-timeout=$WGET_TIMEOUT --read-timeout=$WGET_TIMEOUT -O $TMP #> /dev/null 2>&1
 mv $TMP $ABSDIR/forecast
 echo "[`date`] got forecast"
 wget $WEATHERCAM -t $WGET_TRIES --connect-timeout=$WGET_TIMEOUT --read-timeout=$WGET_TIMEOUT -O $TMP #>/dev/null 2>&1
 mv $TMP $ABSDIR/1.jpg
 echo "[`date`] got weathercam pic"
 java -cp $INFOBEAMER_CWD/helper/ Clock kitchen_cycler/weather/analogclock/ debug
 echo "[`date`] set clock"
 sleep 30
done
