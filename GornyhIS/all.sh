#!/bin/bash
cd ~/
touch ~/GornyhIS.txt
ls -l /bin/bash
ls -l /bin/bash > infobash.txt
date "+%A"
date "+%A" > day.txt
wget http://www.lib.ru/CARROLL/alice.txt
mv ~/alice.txt ~/alice_mod.txt
wc ~/alice_mod.txt
wc ~/alice_mod.txt >> ~/alice_mod.txt
head -n 19 ~/alice_mod.txt
tail -n 19 ~/alice_mod.txt
mkdir test{1..40}
rmdir *[37]
ls -l ~/
ls -l ~/ > ~/test.txt
wc -l ~/test.txt
wc -l ~/test.txt >> test.txt

for d in */; do
    name=$(basename "$d")
    num=$(echo "$name" | tr -dc '0-9')
    if [ ! -z "$num" ] && [ $((num % 5)) -eq 0 ]; then
        date +%F > "$d/date.txt"
        echo "$name"
    fi
done

for d in */; do
    name=$(basename "$d")
    num=$(echo "$name" | tr -dc '0-9')
    if [ ! -z "$num" ] && [ $((num % 10)) -eq 0 ]; then
        date +"%H:%M:%S" >> "$d/date.txt"
        echo "time+$name/date.txt"
    fi
done
