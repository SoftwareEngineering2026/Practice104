#!/bin/bash
# Скрипт автоматизирует все шаги задания 104 (Docker) и печатает отчёт в stdout.
set -euo pipefail

cd ~

section() {
  echo
  echo "===== $1 ====="
}

section "Шаг 4: создание файла РукосуеваЕД.txt в домашнем каталоге"
touch РукосуеваЕД.txt
ls -la ~/РукосуеваЕД.txt

section "Шаг 4: команда date — текущий день недели"
date
echo "День недели: $(date +%A)"

section "Шаг 5: расширенная информация о файле /bin/bash"
ls -l /bin/bash
file /bin/bash

section "Шаг 6-7: скачивание Alice's Adventures in Wonderland и переименование в alice.txt"
wget -q -O alice.txt "http://www.lib.ru/CARROLL/alice.txt" || curl -fsSL -o alice.txt "http://www.lib.ru/CARROLL/alice.txt"
ls -la alice.txt

section "Шаг 8: количество слов в alice.txt (wc -w)"
wc -w < alice.txt

section "Шаг 9: первые 19 строк alice.txt (head -n 19)"
head -n 19 alice.txt

section "Шаг 10: последние 17 строк alice.txt (tail -n 17)"
tail -n 17 alice.txt

section "Шаг 11: создание каталогов test1..test40"
for i in $(seq 1 40); do
  mkdir -p "test$i"
done
echo "Создано каталогов: $(ls -d test*/ | wc -l)"

section "Шаг 12: удаление каталогов, оканчивающихся на 3 и 7"
for i in $(seq 1 40); do
  case "$i" in
    *3|*7)
      rmdir "test$i" 2>/dev/null || rm -rf "test$i"
      ;;
  esac
done
echo "Осталось каталогов: $(ls -d test*/ | wc -l)"

section "Шаг 13: список каталогов -> test.txt"
ls -d test*/ > test.txt
cat test.txt

section "Шаг 14: количество строк в test.txt (wc -l)"
wc -l < test.txt

section "Шаг 15: date.txt (формат ГОД-МЕСЯЦ-ДЕНЬ) в каталогах, номер которых кратен 5"
for d in test*/; do
  num="${d%/}"
  num="${num#test}"
  if (( num % 5 == 0 )); then
    date +"%Y-%m-%d" > "$d/date.txt"
  fi
done

section "Шаг 16: дописать текущее время в date.txt в каталогах, номер которых кратен 10"
for d in test*/; do
  num="${d%/}"
  num="${num#test}"
  if (( num % 10 == 0 )); then
    date +"%H:%M:%S" >> "$d/date.txt"
  fi
done

section "Итог: содержимое созданных date.txt"
for d in test*/; do
  if [[ -f "$d/date.txt" ]]; then
    echo "--- $d date.txt ---"
    cat "$d/date.txt"
  fi
done

section "Готово"
echo "Все шаги задания выполнены. Контейнер остаётся запущенным для проверки (docker exec -it <CONTAINER_NAME> bash)."
