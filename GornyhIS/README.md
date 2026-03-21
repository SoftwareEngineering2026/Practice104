## Цель работы
Познакомиться с Docker.
Изучить некоторые базовые команды Linux.

## Что сделано
Запущена ОС Ubuntu 22.04 в Docker.
Далее все в sh скрипте all.sh (собран из history)

## all.sh описание
##!/bin/bash \

cd ~/                                   # Переход в домашний каталог \
touch ~/GornyhIS.txt                    # Создание файла с ФИО \
ls -l /bin/bash                         # Вывод расширенной информации о /bin/bash \
ls -l /bin/bash > infobash.txt          # Запись информации о /bin/bash в файл \
date "+%A"                              # Вывод текущего дня недели \
date "+%A" > day.txt                    # Запись дня недели в файл \
wget http://www.lib.ru/CARROLL/alice.txt # Скачивание файла alice.txt \
mv ~/alice.txt ~/alice_mod.txt          # Переименование файла \
wc ~/alice_mod.txt                      # Вывод количества строк, слов и байт \
wc ~/alice_mod.txt >> ~/alice_mod.txt   # Добавление статистики в конец файла \
head -n 19 ~/alice_mod.txt              # Вывод первых 19 строк \
tail -n 19 ~/alice_mod.txt              # Вывод последних 19 строк \
mkdir test{1..40}                       # Создание 40 каталогов (test1...test40) \
rmdir *[37]                             # Удаление каталогов, заканчивающихся на 3 или 7 \
ls -l ~/                                # Проверка оставшихся файлов \
ls -l ~/ > ~/test.txt                   # Запись списка файлов в test.txt \
wc -l ~/test.txt                        # Подсчет количества строк в списке \
wc -l ~/test.txt >> test.txt            # Добавление количества строк в файл \

for d in */; do                         # тут В каталогах, номера которых кратны 5, создать текстовый файл date.txt с текущей датой в формате: ГОД-МЕСЯЦ-ДЕНЬ. \
    name=$(basename "$d")
    num=$(echo "$name" | tr -dc '0-9')
    if [ ! -z "$num" ] && [ $((num % 5)) -eq 0 ]; then
        date +%F > "$d/date.txt"
        echo "$name"
    fi
done

for d in */; do                         # тут В каталогах, номера которых кратны 10, дописать в текстовый файл date.txt текущее время. \
    name=$(basename "$d")
    num=$(echo "$name" | tr -dc '0-9')
    if [ ! -z "$num" ] && [ $((num % 10)) -eq 0 ]; then
        date +"%H:%M:%S" >> "$d/date.txt"
        echo "time+$name/date.txt"
    fi
done



## собранный образ push на dockerhub

https://hub.docker.com/repository/docker/gornyhivan/gornyhis/general
