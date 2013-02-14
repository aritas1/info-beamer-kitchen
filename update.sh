#!/bin/sh

./stop.sh


./helper/maintenance/update_all.sh
./helper/maintenance/collect_files.sh


./run.sh
