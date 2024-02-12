#!/bin/bash

variables=("HOSTNAME" "TIMEZONE" "USER" "OS" "DATE" "UPTIME" "UPTIME_SEC" "IP" "MASK" "GATEWAY" "RAM_TOTAL" "RAM_USED" "RAM_FREE" "SPACE_ROOT" "SPACE_ROOT_USED" "SPACE_ROOT_FREE")

for i in ${!variables[@]}
do
echo -e "$column1$column2${variables[i]}:$column3$column4 ${!variables[i]}\033[0m"
done

echo "column1_background = $text_column1_background"
echo "column1_font_color = $text_column1_font_color"
echo "column2_background = $text_column2_background"
echo "column2_font_color = $text_column2_font_color"
