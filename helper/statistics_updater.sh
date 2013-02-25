#!/bin/bash

CONFIG_FILE=main.conf

if [[ -f $CONFIG_FILE ]]; then
        . $CONFIG_FILE
else
   echo "main.conf not found! Run commands from the directory where main.conf is located."
   exit
fi

SUBDIR="kitchen_cycler/statistics"

ABSDIR=$INFOBEAMER_CWD/$SUBDIR
TMP=$ABSDIR/tmp

while :
do
 wget localhost/wg-beamer/barcode.php -t $WGET_TRIES --connect-timeout=$WGET_TIMEOUT --read-timeout=$WGET_TIMEOUT -O $TMP #> /dev/null 2>&1
 convert  $TMP $ABSDIR/gesamt.jpg
 echo "[`date`] got statistics"
 rm $TMP
 sleep 120
done
