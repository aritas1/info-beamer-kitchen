#!/bin/bash

source settings.cfg

export INFOBEAMER_CWD=`pwd`

echo "STARTING INFOBEAMER"

INFOBEAMER_FULLSCREEN=1 ../info-beamer/info-beamer ./kitchen_cycler/ &

./run_helpers.sh
