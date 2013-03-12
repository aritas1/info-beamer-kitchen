#!/bin/bash
../apache-tomcat/bin/shutdown.sh
../apache-tomcat/bin/startup.sh


sleep 15

while :
do
wget --output-document tmp 'http://localhost:8080/simpleefa/connection?from=6906707&to=6906508'
mv tmp kitchen_cycler/trains/connections
sleep 360
done
