FROM java:8-alpine

ENV HOME_DIR /opt
ENV VERSION 2.3.0

WORKDIR ${HOME_DIR}

RUN apk add --update bash curl tar && \
    curl -O https://download.elastic.co/logstash/logstash/logstash-${VERSION}.tar.gz && \
    tar -xvf logstash-${VERSION}.tar.gz && \
    rm -rf logstash-${VERSION}.tar.gz /var/cache/apk/* && \
    ln -s logstash-${VERSION} logstash

COPY assets/logstash.conf /etc/logstash.conf

EXPOSE 5000

ENTRYPOINT ["/opt/logstash/bin/logstash"]

CMD []
