#!/bin/bash

cd /root

touch LysykhVA.txt

date +"%A"

ls -l /bin/bash
file /bin/bash

curl -L "http://www.lib.ru/CARROLL/alice.txt?_Ascii.txt" -o alice.txt

wc -w alice.txt

head -19 alice.txt

tail -17 alice.txt

mkdir test{1..40}

rmdir test3 test7 test13 test17 test23 test27 test33 test37

ls -d test* > test.txt

wc -l test.txt

for i in 5 10 15 20 25 30 35 40
do
    date +%F > test$i/date.txt
done

for i in 10 20 30 40
do
    date +%T >> test$i/date.txt
done