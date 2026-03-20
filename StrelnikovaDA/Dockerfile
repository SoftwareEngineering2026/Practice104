# Dockerfile для Практики 104 - Strelnikova D A
FROM ubuntu:22.04

# Установка необходимых пакетов
RUN apt-get update && \
    apt-get install -y bash wget curl coreutils file ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Рабочая директория
WORKDIR /app

# Копируем скрипт setup.sh
COPY setup.sh .
RUN chmod +x setup.sh

# Выполняем скрипт во время сборки
RUN ./setup.sh

# По умолчанию запускаем bash для интерактивной работы
CMD ["bash"]