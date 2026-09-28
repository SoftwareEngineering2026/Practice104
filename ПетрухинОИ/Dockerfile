FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        bash \
        ca-certificates \
        coreutils \
        file \
        wget \
    && rm -rf /var/lib/apt/lists/*

COPY run.sh /usr/local/bin/run-practice.sh
RUN chmod +x /usr/local/bin/run-practice.sh

WORKDIR /root

CMD ["bash"]
