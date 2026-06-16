#!/bin/bash

# Переходим в домашний каталог
cd ~

# Создаём файл с фамилией и инициалами
touch PolyanskyS.txt

# Выводим день недели
date +%A >> PolyanskyS.txt

# Информация о /bin/bash
ls -la /bin/bash >> PolyanskyS.txt
echo "/bin/bash - это командный интерпретатор" >> PolyanskyS.txt

# Скачиваем книгу
curl -o alice.txt http://www.lib.ru/CARROLL/alice.txt

# Количество слов
echo "Количество слов: $(wc -w < alice.txt)" >> PolyanskyS.txt

# Первые 19 строк
head -19 alice.txt > first19.txt

# Последние 17 строк
tail -17 alice.txt > last17.txt

# Создаём каталоги
mkdir test{1..40}

# Удаляем каталоги на 3 и 7
rm -rf test*3 test*7

# Список каталогов в test.txt
ls -d test*/ > test.txt

# Количество строк в test.txt
echo "Количество каталогов: $(wc -l < test.txt)" >> PolyanskyS.txt

# В каталогах, кратных 5, создаём date.txt с датой
for i in 5 10 15 20 25 30 35 40; do
    if [ -d test$i ]; then
        date +%Y-%m-%d > test$i/date.txt
    fi
done

# В каталогах, кратных 10, дописываем время
for i in 10 20 30 40; do
    if [ -d test$i ]; then
        date +%H:%M:%S >> test$i/date.txt
    fi
done

echo "Все действия выполнены!"
