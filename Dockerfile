FROM frolvlad/alpine-glibc
MAINTAINER lida.he@dell.com

ENV FILEBEAT_VERSION=5.2.0

RUN apk add --no-cache \
      ca-certificates \
      curl

RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-${FILEBEAT_VERSION}-linux-x86_64.tar.gz && \
    tar -xvvf filebeat-${FILEBEAT_VERSION}-linux-x86_64.tar.gz && \
    mv filebeat-${FILEBEAT_VERSION}-linux-x86_64/ /filebeat && \
    mv /filebeat/filebeat.yml /filebeat/filebeat.example.yml && \
    mv /filebeat/filebeat /bin/filebeat && \
    chmod +x /bin/filebeat && \
    mkdir -p /filebeat/config /filebeat/data

WORKDIR /filebeat

ADD entrypoint.sh /filebeat/entrypoint.sh
RUN chmod +x /filebeat/entrypoint.sh

ENTRYPOINT /filebeat/entrypoint.sh
CMD ["/filebeat/filebeat", "-e", "*", "/filebeat/filebeat.yml"]
