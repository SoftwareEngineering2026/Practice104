FROM ubuntu:24.04

WORKDIR /root

RUN apt-get update && apt-get install -y \
    bash \
    wget \
    curl \
    file \
 && rm -rf /var/lib/apt/lists/*

COPY script.sh /usr/local/bin/script.sh

RUN chmod +x /usr/local/bin/script.sh

CMD ["/bin/bash", "/usr/local/bin/script.sh"]