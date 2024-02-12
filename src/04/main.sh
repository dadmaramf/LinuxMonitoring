#!/bin/bash
if  ! [ -f Output.sh -a -f Input.sh ]; then
    echo "ERROR: No such file or directory"
    exit 1
fi

if ! [ $# -eq 0 ]; then
        echo "ERROR: This script runs without parameters."
        exit 1
fi

if ! [ -f "config" ]; then
    echo "ERROR: No such file or directory: config"
    exit 1
fi

source config

FUN_PROVERKS(){
    if ! [[ $2 =~ ^[1-6]{1}$ ]];then
        if (( $1 % 2 != 0 ));then
            echo "6"
        else
            echo "1"
        fi 
    else 
        echo "$2"
    fi
}   


output1=$(FUN_PROVERKS 1 $column1_background)
output2=$(FUN_PROVERKS 2 $column1_font_color)
output3=$(FUN_PROVERKS 3 $column2_background)
output4=$(FUN_PROVERKS 4 $column2_font_color)


if [[ "$output1" -eq "$output2" ]] || [[ "$output3" -eq  "$output4" ]]; then
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