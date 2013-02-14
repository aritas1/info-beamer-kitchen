#!/bin/bash

if [ $# -lt 1 ]
then
        echo "Usage: $0 {nodeName|clear}"
        exit
fi

echo "Arguments: $1"


case "$1" in

'clear')  echo "Send Clear"
    echo -n "kitchen_cycler/interrupt/clear" | nc -u localhost 4444
    ;;
*) echo "Send toNode $1"
   echo -n "kitchen_cycler/interrupt/tonode:$1" | nc -u localhost 4444
   ;;
esac
