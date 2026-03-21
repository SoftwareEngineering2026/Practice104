#!/usr/bin/env bash
set -e

cd ~

touch KachalovMA.txt
date +"%A"

ls -l /bin/bash
file /bin/bash
stat /bin/bash

wget -O alice.txt http://www.lib.ru/CARROLL/alice.txt
wc -w < alice.txt

head -n 19 alice.txt
tail -n 17 alice.txt

mkdir test{1..40}
rm -r test*3 test*7

ls -d test* > test.txt
wc -l < test.txt

for i in $(seq 5 5 40); do
  if [ -d "test$i" ]; then
    date +"%F" > "test$i/date.txt"
  fi
done

for i in $(seq 10 10 40); do
  if [ -d "test$i" ]; then
    date +"%T" >> "test$i/date.txt"
  fi
done