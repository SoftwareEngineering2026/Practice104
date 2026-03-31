#!/bin/bash
set -e

cd ~

touch LukinykhDI.txt

echo "Текущий день недели:"
date +"%A"

echo
echo "Информация о /bin/bash:"
ls -l /bin/bash
file /bin/bash

echo
echo "Скачивание alice.txt..."
wget -O alice.txt http://www.lib.ru/CARROLL/alice.txt || curl -o alice.txt http://www.lib.ru/CARROLL/alice.txt

echo
echo "Количество слов в alice.txt:"
wc -w < alice.txt

echo
echo "Первые 19 строк alice.txt:"
head -n 19 alice.txt

echo
echo "Последние 17 строк alice.txt:"
tail -n 17 alice.txt

for i in {1..40}; do
    mkdir "test$i"
done

for i in {1..40}; do
    last_digit=$((i % 10))
    if [ "$last_digit" -eq 3 ] || [ "$last_digit" -eq 7 ]; then
        rmdir "test$i"
    fi
done

ls -d test*/ > test.txt

echo
echo "Количество строк в test.txt:"
wc -l < test.txt

for i in {1..40}; do
    if [ $((i % 5)) -eq 0 ] && [ -d "test$i" ]; then
        date +"%Y-%m-%d" > "test$i/date.txt"
    fi
done

for i in {1..40}; do
    if [ $((i % 10)) -eq 0 ] && [ -d "test$i" ]; then
        date +"%H:%M:%S" >> "test$i/date.txt"
    fi
done

echo
echo "Работа завершена."