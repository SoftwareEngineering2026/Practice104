FROM alpine:3.20

RUN apk add --no-cache bash curl wget coreutils file

WORKDIR /root

COPY script.sh /root/script.sh
RUN chmod +x /root/script.sh

CMD ["/bin/bash"]