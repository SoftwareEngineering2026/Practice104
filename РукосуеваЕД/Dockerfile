# Минимальный образ, как того требует задание 104
FROM alpine:latest

# Устанавливаем bash (в alpine его нет по умолчанию) и утилиты,
# которые нужны для выполнения дальнейших шагов задания
RUN apk update && apk add --no-cache bash coreutils file wget curl

WORKDIR /root

COPY run.sh /root/run.sh
RUN chmod +x /root/run.sh

# При старте контейнера выполняем все шаги задания через bash,
# затем оставляем контейнер запущенным, чтобы можно было
# подключиться и проверить результат (docker exec -it CONTAINER_NAME bash)
CMD ["/bin/bash", "-c", "/root/run.sh; tail -f /dev/null"]
