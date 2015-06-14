FROM jonbrouse/java:8

RUN apt-get update && \
    apt-get install -y curl && \
    apt-get autoclean && \
    apt-get --purge -y autoremove

ENV HOME_DIR /opt
ENV VERSION 1.5.0

WORKDIR ${HOME_DIR}

RUN curl -O https://download.elasticsearch.org/logstash/logstash/logstash-${VERSION}.tar.gz && \
    tar -xvf logstash-${VERSION}.tar.gz && \
    rm -rf logstash-${VERSION}.tar.gz && \
    ln -s logstash-${VERSION} logstash

# I want to mount the conf file at run time instead 
# of adding it during the build process. 
#COPY assets/logstash.conf /etc/logstash.conf

EXPOSE 5000

ENTRYPOINT ["/opt/logstash/bin/logstash"]

CMD []
