# Базовый образ — Ubuntu 22.04
FROM ubuntu:22.04

# Установка необходимых пакетов
RUN apt-get update && apt-get install -y wget file bash

# Копируем скрипт внутрь образа
COPY script.sh /script.sh

# Делаем скрипт исполняемым
RUN chmod +x /script.sh

# При запуске контейнера выполняем скрипт
CMD ["/script.sh"]