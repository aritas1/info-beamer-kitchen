#!/bin/sh

cp -f helper/maintenance/main.conf.dummy ./main.conf
echo "# Set the working directory" >> main.conf
PWD=`pwd`
echo "export INFOBEAMER_CWD=$PWD" >> main.conf


./helper/maintenance/install_dep.sh
./helper/maintenance/install_udev.sh
./helper/maintenance/collect_files.sh
