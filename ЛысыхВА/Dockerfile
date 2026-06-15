FROM ubuntu:24.04

RUN apt-get update && \
    apt-get install -y bash wget curl file

COPY script.sh /root/script.sh

RUN chmod +x /root/script.sh

CMD ["/root/script.sh"]