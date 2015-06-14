FROM jonbrouse/docker-java:8

RUN apt-get update && \
    apt-get install -y curl && \
    apt-get autoclean && \
    apt-get --purge -y autoremove

ENV HOME_DIR /opt
ENV VERSION 1.5.1

WORKDIR ${HOME_DIR}

RUN curl -O https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-${VERSION}.tar.gz && \
    tar -xvf elasticsearch-${VERSION}.tar.gz && \
    rm -rf elasticsearch-${VERSION}.tar.gz && \
    ln -s elasticsearch-${VERSION} elasticsearch
#    elasticsearch/bin/plugin -install lmenezes/elasticsearch-kopf

COPY assets/elasticsearch.yml /opt/elasticsearch/config/elasticsearch.yml

EXPOSE 9200
EXPOSE 9300
EXPOSE 9400

VOLUME /opt/elasticsearch/data

ENTRYPOINT ["/opt/elasticsearch/bin/elasticsearch"]

CMD []
