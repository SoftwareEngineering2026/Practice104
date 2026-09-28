#!/usr/bin/env bash
set -euo pipefail

# Практическая работа №104 — Петрухин ОИ
# Все команды выполняются из домашнего каталога root (/root).

cd "$HOME"

echo "=== 1. Имя инициалов в имени файла ==="
touch "$HOME/ПетрухинОИ.txt"
ls -l "$HOME/ПетрухинОИ.txt"

echo
echo "=== 2. Текущий день недели ==="
date '+%A'

echo
echo "=== 3. Информация о /bin/bash ==="
file /bin/bash
ls -lh /bin/bash

echo
echo "=== 4. Загрузка Alice's Adventures in Wonderland ==="
wget -q -O alice_download.txt http://www.lib.ru/CARROLL/alice.txt
mv alice_download.txt alice.txt
ls -lh alice.txt

echo
echo "=== 5. Количество слов в alice.txt ==="
wc -w < alice.txt

echo
echo "=== 6. Первые 19 строк ==="
head -n 19 alice.txt

echo
echo "=== 7. Последние 17 строк ==="
tail -n 17 alice.txt

echo
echo "=== 8. Создание test1...test40 ==="
for i in {1..40}; do
    mkdir "test${i}"
done

# Удаляем только каталоги, оканчивающиеся на 3 и 7.
# Для каталогов с последней цифрой 3 используется rm, с 7 — rmdir.
for i in {1..40}; do
    last_digit=$((i % 10))
    if [[ "$last_digit" -eq 3 ]]; then
        rm -r "test${i}"
    elif [[ "$last_digit" -eq 7 ]]; then
        rmdir "test${i}"
    fi
done

echo
echo "=== 9. Список оставшихся каталогов -> test.txt ==="
ls -d test*/ > test.txt
cat test.txt

echo
echo "=== 10. Количество строк в test.txt ==="
wc -l < test.txt

echo
echo "=== 11. Создание date.txt в каталогах, кратных 5 ==="
for i in {5..40..5}; do
    date '+%Y-%m-%d' > "test${i}/date.txt"
done

# В каталогах, кратных 10, время дописывается к уже записанной дате.
for i in {10..40..10}; do
    date '+%H:%M:%S' >> "test${i}/date.txt"
done

echo
echo "=== 12. Проверка date.txt ==="
for i in {5..40..5}; do
    echo "--- test${i}/date.txt ---"
    cat "test${i}/date.txt"
done

echo
echo "Практическая работа выполнена."
