FROM alpine:latest

RUN apk add --no-cache bash curl wget coreutils

WORKDIR /home

COPY script.sh /script.sh
RUN chmod +x /script.sh

CMD ["/bin/bash", "/script.sh"]