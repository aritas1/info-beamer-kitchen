#!/bin/bash
echo $INFOBEAMER_CWD

SUBDIR="kitchen_cycler/weather"

ABSDIR=$INFOBEAMER_CWD/$SUBDIR

echo $ABSDIR

#--connect-timeout=seconds
#--read-timeout=seconds

ret=`python -c 'import sys; print("%i" % (sys.hexversion<0x03000000))'`
if [ $ret -eq 0 ]; then
    echo "we require python version < 3"
    PYTHON2=0
else
    PYTHON2=1
    echo "python version is < 3"
fi

while :
do
 wget http://api.openweathermap.org/data/2.1/weather/city/2925177?type=json -O $ABSDIR/tempcurrent > /dev/null 2>&1
 mv $ABSDIR/tempcurrent $ABSDIR/current
 echo "[`date`] got current"
 wget http://api.openweathermap.org/data/2.2/forecast/city/2925177?mode=daily_compact -O $ABSDIR/tempforecast > /dev/null 2>&1
 mv $ABSDIR/tempforecast $ABSDIR/forecast
 echo "[`date`] got forecast"
 wget http://www.uniklinik-freiburg.de/modules/webcam/550/1.jpg -t 1 --read-timeout=3 -O $ABSDIR/temppic.jpg >/dev/null 2>&1
 mv $ABSDIR/temppic.jpg $ABSDIR/1.jpg
 echo "[`date`] got pic"

if [ $PYTHON2 -eq 0 ]; then
 python $INFOBEAMER_CWD/helper/clock.py
else
 python $INFOBEAMER_CWD/helper/clock_python2.py
fi
 #uncomment following line if using python2
 #python analogclock/clock_python2.py
 echo "[`date`] set clock"
 sleep 30
done
