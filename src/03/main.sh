#!/bin/bash
if  ! [ -f Output.sh -a -f Input.sh ]; then
    echo "ERROR: no such file or directory"
    exit 1
fi

if ! [ $# -eq 4 ]; then
        echo "ERROR: The number of arguments is less than 4!
Color designations: (1 - white, 2 - red, 3 - green, 4 - blue, 5 - purple, 6 - black)
Parameter 1 - background of value names (HOSTNAME, TIMEZONE, USER, etc.).
Parameter 2 - font color of value names (HOSTNAME, TIMEZONE, USER, etc.)
Parameter 3 - background of values (after the '=' sign).
Parameter 4 - font color of values (after the '=' sign)"
        exit 1
fi

for arg in "$@"
do
    if ! [[ "$arg" =~ ^[1-6]{1}$ ]];then
        echo "ERROR: Argument $arg not found."
        echo "Available arguments: (1 - white, 2 - red, 3 - green, 4 - blue, 5 - purple, 6 - black)"
        exit 1
    fi
done

if [ "$1" -eq "$2" ] || [[ "$3" -eq  "$4" ]]; then
        echo "ERROR: The font and background colors of a single column must not match. Try again "
        exit 1
fi


chmod +x Output.sh
chmod +x Input.sh

if [ -f "install.sh" ]; then
    chmod +x install.sh
    source install.sh
fi

source Input.sh
source Output.sh