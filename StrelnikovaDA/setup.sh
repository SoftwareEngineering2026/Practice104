#!/bin/bash
# setup.sh для Практики 104 - Strelnikova D A
# Выполняет все команды практики внутри контейнера
set -e

cd "$(pwd)"

echo "[STEP] Создаём файл StrelnikovaDA.txt"
touch StrelnikovaDA.txt

echo "[STEP] Текущий день недели:"
date +%A

echo "[STEP] Информация о /bin/bash:"
file /bin/bash

echo "[STEP] Скачиваем alice.txt"
wget --no-check-certificate http://www.lib.ru/CARROLL/alice.txt -O alice.txt || echo "Ошибка при скачивании alice.txt"

echo "[STEP] Количество слов в alice.txt:"
wc -w alice.txt

echo "[STEP] Первые 19 строк:"
head -n 19 alice.txt

echo "[STEP] Последние 17 строк:"
tail -n 17 alice.txt

echo "[STEP] Создаём каталоги test1..test40"
mkdir -p test{1..40}

echo "[STEP] Удаляем каталоги, оканчивающиеся на 3 и 7"
rm -rf test*3 test*7

echo "[STEP] Выводим список каталогов в test.txt"
ls -d test*/ > test.txt

echo "[STEP] Количество каталогов после удаления:"
wc -l test.txt

echo "[STEP] Создаём date.txt с датой в каталогах, кратных 5"
for i in 5 10 15 20 25 30 35 40; do
  [ -d test$i ] && date +%Y-%m-%d > test$i/date.txt
done

echo "[STEP] Дописываем текущее время в date.txt для каталогов, кратных 10"
for i in 10 20 30 40; do
  [ -d test$i ] && date +%H:%M:%S >> test$i/date.txt
done

echo "===== setup.sh выполнен успешно! ====="