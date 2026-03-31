FROM ubuntu:22.04

# Установка пакетов
RUN apt update && apt install -y wget

#Копируем скрипт script.sh и выполняем
COPY script.sh /script.sh
RUN chmod +x /script.sh

# Запускаем bash и script
CMD ["/bin/bash", "/script.sh"]
