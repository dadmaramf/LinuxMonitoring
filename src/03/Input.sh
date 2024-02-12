#!/bin/bash

# 0 - white, 1 - red, 2 - green, 3 - blue, 4 – purple, 5 - black
back=("\033[0;107m" "\033[41m" "\033[42m" "\033[106m" "\033[45m" "\033[40m")
font=("\033[97m" "\033[31m" "\033[32m" "\033[96m" "\033[35m" "\033[30m")

col1back=${back[$(( $1 - 1 ))]}
col1font=${font[$(( $2 - 1 ))]}
col2back=${back[$(( $3 - 1 ))]}
col2font=${font[$(( $4 - 1 ))]}


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