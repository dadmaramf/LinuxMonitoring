#!/bin/bash

if  ! [ -f Output.sh -a -f Input.sh ]; then
    echo "ERROR: Script file not found."
    exit 1
fi

if ! [ $# -eq 0 ]; then
        echo "ERROR: This script runs without parameters."
        exit 1
fi


if [ -f "install.sh" ]; then
    chmod +x install.sh
    source install.sh
fi

chmod +x Output.sh
chmod +x Input.sh

source Input.sh
source Output.sh
