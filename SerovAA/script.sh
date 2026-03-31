#!/bin/bash

cd ~
touch SerovAA.txt

echo "День недели: $(date +%A)"

echo "Информация о /bin/bash:"
ls -l /bin/bash
file /bin/bash

wget http://www.lib.ru/CARROLL/alice.txt -O alice.txt

echo "Количество слов в alice.txt: $(wc -w < alice.txt)"

echo "Первые 19 строк:"
head -n 19 alice.txt

echo "Последние 17 строк:"
tail -n 17 alice.txt

mkdir test{1..40}
rmdir test*3 test*7 2>/dev/null || true

ls -d test* > test.txt
echo "Количество строк в test.txt: $(wc -l < test.txt)"

for i in {5..40..5}; do
    if [ -d test$i ]; then
        date +%Y-%m-%d > test$i/date.txt
    fi
done

for i in {10..40..10}; do
    if [ -d test$i ]; then
        date +%T >> test$i/date.txt
    fi
done

tail -f /dev/null
