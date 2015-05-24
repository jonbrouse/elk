#FROM debian:jessie
FROM brouse/java

ENV HOME_DIR /opt
ENV VERSION 1.5.0

WORKDIR ${HOME_DIR}

RUN apt-get update && \
    apt-get install -y curl

RUN curl -O https://download.elasticsearch.org/logstash/logstash/logstash-${VERSION}.tar.gz && \
    tar -xvf logstash-${VERSION}.tar.gz && \
    rm -rf logstash-${VERSION}.tar.gz && \
    ln -s logstash-${VERSION} logstash

COPY assets/logstash.conf /etc/logstash.conf

ENTRYPOINT ["/opt/logstash/bin/logstash"]

CMD []
