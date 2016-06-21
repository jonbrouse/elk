FROM java:8-alpine

RUN apk add --update curl tar && \
    rm -rf /var/cache/apk/*

ENV HOME_DIR /opt
ENV VERSION 2.3.3

WORKDIR ${HOME_DIR}

RUN curl -O https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/${VERSION}/elasticsearch-${VERSION}.tar.gz && \
    tar -xvf elasticsearch-${VERSION}.tar.gz && \
    rm -rf elasticsearch-${VERSION}.tar.gz && \
    ln -s elasticsearch-${VERSION} elasticsearch

RUN /opt/elasticsearch/bin/plugin install license && \
    /opt/elasticsearch/bin/plugin install license

COPY assets/elasticsearch.yml /opt/elasticsearch/config/elasticsearch.yml

EXPOSE 9200
EXPOSE 9300
EXPOSE 9400

VOLUME /opt/elasticsearch/data

ENTRYPOINT ["/opt/elasticsearch/bin/elasticsearch"]

CMD []
