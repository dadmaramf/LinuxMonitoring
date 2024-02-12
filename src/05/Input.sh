#!/bin/bash

DIR="$1"
TOTALDIR=$(find "$DIR" -type d | wc -l)
SORTWEIGHT="$(du -Sh $DIR | sort -rh | head -5 | awk 'BEGIN{i=1}{printf "%d - %s, %s\n", i, $2, $1; i++}')"
TOTALFILES=$(find "$DIR" -type f | wc -l)
CONFFILES=$(find "$DIR" -type f -name "*.conf" | wc -l)
TEXTFILES=$(find "$DIR" -type f -name "*.txt" | wc -l)
EXECFILES=$(find "$DIR" -type f -executable | wc -l)
LOGFILES=$(find "$DIR" -type f -name "*.log" | wc -l)
ARCHIVE=$(find "$DIR" -type f -name "*.zip" -o -name "*.tar" -o -name "*.gz" | wc -l)
SYMLINK=$(find "$DIR" -type l | wc -l)
SORTWEIGHTFIL=$(find "$DIR" -type f -exec du -h  {} + | sort -rh | awk 'NR <= 10 {print}')
files_with_sizes=$(find "$DIR" -type f -perm /111 -exec stat -c "%s %n" {} \;)
SORTEDFILES=$(echo "$files_with_sizes" | sort -rn | head -n 10)
