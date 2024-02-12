#!/bin/bash

if  ! [ -f Output.sh ]; then
    echo "ERROR: скрипта нет."
    exit 1
fi

if ! [[ $# == 1 ]] || [[ $1 =~ ^[0-9]+$ ]]; then
    echo "ERROR: введите слово"
    exit 1;

fi 


chmod +x Output.sh
source Output.sh