#!/bin/bash

cd ~

touch ZaharenkoAA.txt

echo "День недели: $(date +%A)"

file /bin/bash

wget -q -O alice.tmp http://www.lib.ru/CARROLL/alice.txt && mv alice.tmp alice.txt \

echo "Количество слов в alice.txt: $(wc -w < alice.txt)"

echo -e "\nПервые 19 строк alice.txt:"
head -19 alice.txt

echo -e "\nПоследние 17 строк alice.txt:"
tail -17 alice.txt

mkdir test{1..40}

rmdir test*3 test*7

ls -1d test* > test.txt
echo "Количество строк в test.txt: $(wc -l < test.txt)"

for d in test{5,10,15,20,25,30,35,40}; do
    [ -d "$d" ] && date +%Y-%m-%d > "$d/date.txt"
done

for d in test{10,20,30,40}; do
    [ -d "$d" ] && date +%T >> "$d/date.txt"
done