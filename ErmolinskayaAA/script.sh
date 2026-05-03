
SURNAME="ErmolinskayaAA"

echo "=== Практическая работа Docker ==="
echo "Фамилия: $SURNAME"

# 1. Создаем файл
touch "/root/${SURNAME}.txt"

# 2. День недели
echo -e "\n=== День недели ==="
date +"%A"

# 3. Информация о bash
echo -e "\n=== Информация о /bin/bash ==="
ls -la /bin/bash

# 4. Скачиваем книгу
echo -e "\n=== Скачиваем книгу ==="
wget -O alice.txt http://www.lib.ru/CARROLL/alice.txt

# 5. Количество слов
echo -e "\n=== Количество слов ==="
wc -w alice.txt

# 6. Первые 19 строк
echo -e "\n=== Первые 19 строк ==="
head -19 alice.txt

# 7. Последние 17 строк
echo -e "\n=== Последние 17 строк ==="
tail -17 alice.txt

# 8. Создаем каталоги
echo -e "\n=== Создаем каталоги test1-test40 ==="
for i in {1..40}; do
    mkdir -p "test$i"
done

# 9. Удаляем каталоги на 3 и 7
echo -e "\n=== Удаляем каталоги с окончанием на 3 и 7 ==="
for i in {1..40}; do
    if [[ $i =~ [37]$ ]]; then
        rmdir "test$i" 2>/dev/null
    fi
done


# 10. Список каталогов в файл
ls -d test*/ > test.txt
echo -e "\n=== Список каталогов сохранен в test.txt ==="

# 11. Количество строк
echo -e "\n=== Количество оставшихся каталогов ==="
wc -l test.txt

# 12. Создаем date.txt в каталогах, кратных 5
echo -e "\n=== Создаем date.txt в каталогах, кратных 5 ==="
for i in {1..40}; do
    if [ $((i % 5)) -eq 0 ] && [ -d "test$i" ]; then
        echo $(date +"%Y-%m-%d") > "test$i/date.txt"
        echo "Создан test$i/date.txt"
    fi
done

# 13. Добавляем время в каталоги, кратные 10
echo -e "\n=== Добавляем время в каталоги, кратные 10 ==="
for i in {1..40}; do
    if [ $((i % 10)) -eq 0 ] && [ -d "test$i" ]; then
        echo $(date +"%H:%M:%S") >> "test$i/date.txt"
        echo "Обновлен test$i/date.txt"
    fi
done
