FROM alpine:latest

RUN apk update && apk add --no-cache bash wget file

COPY run.sh /run.sh
RUN chmod +x /run.sh

RUN sed -i 's/\r$//' /run.sh

CMD ["/bin/bash", "/run.sh"]