#!/bin/bash
if  ! [ -f Output.sh -a -f Input.sh ]; then
    echo "ERROR: скрипта нет."
    exit 1
fi

if ! [ $# -eq 1 ]; then
        echo "ERROR: The script is run with a single parameter."
        exit 1
fi

DIR="$1"
last_char=${DIR: -1} 

if [ ! -d "$1" ]; then
    echo "ERROR: no such directory $DIR"
    exit 1
fi

if  [[  "$last_char" != "/" ]] ; then
 echo "Path must end with '/'"
    exit 1
fi

start_time=$(date +%s)

chmod +x Output.sh
chmod +x Input.sh

source Input.sh
source Output.sh