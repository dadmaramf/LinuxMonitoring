#!/bin/bash

fun_color(){
    case "$3" in
        1) 
        if (( $1 % 2 != 0 ));then
            eval "$2='\033[107m'"
        else
            eval "$2='\033[97m'"
        fi ;;
        2) 
        if (( $1 % 2 != 0 ));then
            eval "$2='\033[41m'"
        else
            eval "$2='\033[31m'"
        fi;;
        3)
         if (( $1 % 2 != 0 ));then             
           eval "$2='\033[42m'"
        else
            eval "$2='\033[32m'"
        fi;;
        4)
         if (( $1 % 2 != 0 ));then
            eval "$2='\033[106m'"
        else
            eval "$2='\033[96m'"
        fi;;
        5)
        if (( $1 % 2 != 0 ));then
            eval "$2='\033[45m'"
        else
            eval "$2='\033[35m'"
        fi;;
        6)
        if (( $1 % 2 != 0 ));then
            eval "$2='\033[40m'"
        else
            eval "$2='\033[30m'"
        fi;;
        *)
        if (( $1 % 2 == 0 ));then
            eval "$2='\033[97m'" 
        else
            eval "$2='\033[40m'"
        fi;;
    esac
}

fun_color_text(){
    if [[ $3 -eq 1 ]]; then
        eval "$2='1 (white)'"

    elif [[ $3 -eq 2 ]]; then
        eval "$2='2 (red)'"

    elif [[ $3 -eq 3 ]]; then
        eval "$2='3 (green)'"

    elif [[ $3 -eq 4 ]]; then          
        eval "$2='4 (blue)'"

    elif [[ $3 -eq 5 ]]; then
        eval "$2='5 (purple)'"

    elif [[ $3 -eq 6 ]]; then
        eval "$2='6 (black)'"

    else
        if (( $1 % 2 != 0 )); then
            eval "$2='default (black)'"
        else
            eval "$2='default (white)'"
        fi
    fi
}

fun_color 1 column1 $column1_background 
fun_color 2 column2 $column1_font_color  
fun_color 3 column3 $column2_background  
fun_color 4 column4 $column2_font_color  
fun_color_text 1 text_column1_background $column1_background  
fun_color_text 2 text_column1_font_color $column1_font_color  
fun_color_text 3 text_column2_background $column2_background  
fun_color_text 4 text_column2_font_color $column2_font_color  

export HOSTNAME=$(hostname)
export TIMEZONE=$(timedatectl show --property=Timezone --value)
export USER=$(whoami)
export OS=$OSTYPE
export DATE=$(date "+%d %B %Y %H:%M:%S")
export UPTIME=$(uptime -p)
export UPTIME_SEC=$(cat /proc/uptime | awk '{print $1}')
export IP=$(hostname -I)
export MASK=$(ifconfig | grep inet | grep netmask | awk 'NR==1 {printf $4}')
export GATEWAY=$(ip route show | grep default | awk '{print $3}')
export RAM_TOTAL=$(free --mega | awk '/Mem/ {printf "%.3f GB", $2/1024}')
export RAM_USED=$(free --mega | awk '/Mem/ {printf "%.3f GB", $3/1024}')
export RAM_FREE=$(free --mega | awk '/Mem/ {printf "%.3f GB", $4/1024}')
export SPACE_ROOT=$(df --output=size / | tail -n 1 | awk '{printf "%.2f MB", $1/1024/1024}')
export SPACE_ROOT_USED=$(df --output=used / | tail -n 1 | awk '{printf "%.2f MB", $1/1024/1024}')
export SPACE_ROOT_FREE=$(df --output=avail / | tail -n 1 | awk '{printf "%.2f MB", $1/1024/1024}')