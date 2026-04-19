#!/bin/bash

# Создание файла с фамилией и инициалами
cd ~
touch KrylovMA.txt

# Текущий день недели
date +"%A"

# Информация о /bin/bash
file /bin/bash
ls -l /bin/bash

# Скачивание текста
wget -O alice.txt http://www.lib.ru/CARROLL/alice.txt

# Количество слов в alice.txt
wc -w alice.txt

# Первые 19 строк
head -n 19 alice.txt

# Последние 17 строк
tail -n 17 alice.txt

# Создание 40 каталогов
for i in {1..40}; do
    mkdir "test$i"
done

# Удаление каталогов, заканчивающихся на 3 и 7
rmdir test*3 test*7 2>/dev/null || rm -r test*3 test*7 2>/dev/null

# Список оставшихся каталогов в test.txt 
ls -d test* > test.txt

# Количество строк в test.txt
wc -l test.txt

# Файл date.txt для каталогов, кратных 5 
for i in {5..40..5}; do
    if [ -d "test$i" ]; then
        date +"%Y-%m-%d" > "test$i/date.txt"
    fi
done

# Дописывание времени для каталогов, кратных 10 
for i in {10..40..10}; do
    if [ -d "test$i" ]; then
        date +"%H:%M:%S" >> "test$i/date.txt"
    fi
done
