FROM jonbrouse/docker-java

ENV HOME_DIR /opt
ENV VERSION 1.5.0

WORKDIR ${HOME_DIR}

RUN apt-get update && \
    apt-get install -y curl && \
    apt-get autoclean && \
    apt-get --purge -y autoremove

RUN curl -O https://download.elasticsearch.org/logstash/logstash/logstash-${VERSION}.tar.gz && \
    tar -xvf logstash-${VERSION}.tar.gz && \
    rm -rf logstash-${VERSION}.tar.gz && \
    ln -s logstash-${VERSION} logstash

COPY assets/logstash.conf /etc/logstash.conf

EXPOSE 5000

ENTRYPOINT ["/opt/logstash/bin/logstash"]

CMD []
