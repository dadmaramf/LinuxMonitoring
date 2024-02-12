#!/bin/bash

echo "Total number of folders (including all nested ones) = $TOTALDIR"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):
$SORTWEIGHT"
echo "Total number of files = $TOTALFILES"
echo "Number of:
Configuration files (with the .conf extension) =  $CONFFILES
Text files = $TEXTFILES
Executable files = $EXECFILES
Log files (with the extension .log) = $LOGFILES
Archive files = $ARCHIVE
Symbolic links = $SYMLINK"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
counter=1
while IFS= read -r line; do
     path=$(echo "$line" | awk '{print $2}')  
     size=$(echo "$line" | awk '{print $1}')
     filename=$(basename "$path")
     file_extension="${filename##*.}"
     echo "$counter - $path, $size, $file_extension"
    counter=$((counter + 1))
done <<< "$SORTWEIGHTFIL"
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file) "
counter=1
exec_files=$(find $DIR 2>/dev/null -type f -executable)
while [ $counter -le 10 ] && read -r NameOfFile;
do
    if [[ -n $NameOfFile ]]; then
        echo -n "$counter - "
        echo -n "$(echo $NameOfFile | awk '{print $2}'), "
        echo -n "$(echo $NameOfFile | awk '{print $1}'), "
        path=$(echo $NameOfFile | awk '{print $2}')
        MD5=$(md5sum $path | awk '{print $1}')
        echo "$MD5"
    fi
    counter=$((counter + 1))
done < <(du -h $exec_files 2>/dev/null | sort -rh | head -10)
end_time=$(date +%s)
execution_time=$(echo "scale=2; $end_time - $start_time" | bc -l | numfmt --format="%0.2f")
echo "Script execution time (in seconds) = $execution_time sec"