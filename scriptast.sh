#!/bin/bash

while true; 
do
    echo "Автор: Астра Григорий"
    echo "Описание: Этот скрипт выводит имя текущего каталога, запрашивает имя файла, и если файл не существует, выводит сообщение об 
ошибке. Затем запрашивает имя пользователя, и если пользователь не является владельцем файла, выводит имя владельца и имя группы файла."
    echo "Название:AstScript"
    current_dir=$(pwd)
    echo "Текущий каталог: $current_dir"

    while true; do
	echo "Введите имя файла: "
        read filename

        if [ ! -f "$filename" ]; then
            echo "Ошибка: файл не существует." >&2
            continue
        fi

        break
    done

    owner=$(stat -c '%U' "$filename")
    group=$(stat -c '%G' "$filename")

    echo "Введите имя пользователя: "
    read username

    if [ "$owner" != "$username" ]; then
        echo "Владелец файла: $owner"
        echo "Группа файла: $group"
    fi

	echo "Хотите выполнить скрипт еще раз? (y/n): "
    read choice
    if [ "$choice" == "n" ]; then
        break
    fi
done
