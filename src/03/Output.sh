#!/bin/bash

variables=("HOSTNAME" "TIMEZONE" "USER" "OS" "DATE" "UPTIME" "UPTIME_SEC" "IP" "MASK" "GATEWAY" "RAM_TOTAL" "RAM_USED" "RAM_FREE" "SPACE_ROOT" "SPACE_ROOT_USED" "SPACE_ROOT_FREE")

for i in ${!variables[@]}
do
echo -e "${col1back}${col1font}${variables[i]}:${col2back}${col2font} ${!variables[i]}\033[0m"

done