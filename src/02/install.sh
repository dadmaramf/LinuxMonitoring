#!/bin/bash
sudo apt-get install net-tools > /dev/null &

# Получение идентификатора процесса
pid=$!

# Вывод ползунка
while true; do
    echo -ne '\r|'
    sleep 0.2
    echo -ne '\r/'
    sleep 0.2
    echo -ne '\r-'
    sleep 0.2
    echo -ne '\r\'
    sleep 0.2

    # Проверка статуса процесса
    if ! ps -p $pid > /dev/null; then
        echo -ne '\r'
        break
    fi
done