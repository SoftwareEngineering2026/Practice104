FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
# Устанавливаем переменную окружения для временной зоны
ENV TZ=Europe/Moscow

# Обновляем пакеты, устанавливаем tzdata и wget
RUN apt-get update && apt-get install -y \
    tzdata \
    wget \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY all.sh .

RUN chmod +x all.sh

CMD ["./all.sh"]