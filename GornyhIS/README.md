## Цель работы
Познакомиться с Docker.
Изучить некоторые базовые команды Linux.

## Что сделано
Запущена ОС Ubuntu 22.04 в Docker.
Далее все в sh скрипте all.sh (собран из history)

## all.sh описание
#!/bin/bash  //указанаие на shell
cd ~/    //переход в домашний каталог
touch ~/GornyhIS.txt //Создан файл ФИО
ls -l /bin/bash //Расширенная информация о файле /bin/bash
ls -l /bin/bash > infobash.txt //Расширенная информация о файле /bin/bash в infobash.txt
date "+%A" //вывод дня
date "+%A" > day.txt //вывод дня в day.txt
wget http://www.lib.ru/CARROLL/alice.txt //качаем alice.txt
mv ~/alice.txt ~/alice_mod.txt //меняем имя alice.txt на alice_mod.txt
wc ~/alice_mod.txt //кол-во символов в alice_mod.txt
wc ~/alice_mod.txt >> ~/alice_mod.txt  //кол-во символов в alice_mod.txt добавим в конец alice_mod.txt
head -n 19 ~/alice_mod.txt //вывод 20 строк сначала alice_mod.txt
tail -n 19 ~/alice_mod.txt //вывод 20 строк конца alice_mod.txt
mkdir test{1..40} //создаем 40 каталогов test1..40
rmdir *[37]   //удаляем каталоги с окончанием на 7 и 3
ls -l ~/  //проверям что их нет
ls -l ~/ > ~/test.txt  //список в файл test.txt
wc -l ~/test.txt   //количество
wc -l ~/test.txt >> test.txt  //количество добавляем в файл test.txt

//тут В каталогах, номера которых кратны 5, создать текстовый файл date.txt с текущей датой в формате: ГОД-МЕСЯЦ-ДЕНЬ.
for d in */; do
    name=$(basename "$d")
    num=$(echo "$name" | tr -dc '0-9')
    if [ ! -z "$num" ] && [ $((num % 5)) -eq 0 ]; then
        date +%F > "$d/date.txt"
        echo "$name"
    fi
done

// тут В каталогах, номера которых кратны 10, дописать в текстовый файл date.txt текущее время.
for d in */; do
    name=$(basename "$d")
    num=$(echo "$name" | tr -dc '0-9')
    if [ ! -z "$num" ] && [ $((num % 10)) -eq 0 ]; then
        date +"%H:%M:%S" >> "$d/date.txt"
        echo "time+$name/date.txt"
    fi
done


##собранный образ push на dockerhub
https://hub.docker.com/repository/docker/gornyhivan/gornyhis/general
