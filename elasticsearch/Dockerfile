FROM openjdk:8u131-jre-alpine

# Install bash to support scripts written by elasticsearch
RUN apk add --no-cache bash curl tar && \
    addgroup -g 750 -S elasticsearch && \
    adduser -u 750 -D -S -G elasticsearch elasticsearch 

ARG VERSION
ENV HOME_DIR /usr/share/elasticsearch
ENV ES_TMPDIR ${HOME_DIR}/tmp

WORKDIR ${HOME_DIR}

RUN curl -fsSL https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-oss-${VERSION}-linux-x86_64.tar.gz | tar zx --strip-components=1 && \
    mkdir -p config data logs ${ES_TMPDIR}

COPY assets/elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml

RUN chown -R elasticsearch:elasticsearch ${HOME_DIR}/*

USER elasticsearch

EXPOSE 9200/tcp 9300/tcp

ENTRYPOINT ["/usr/share/elasticsearch/bin/elasticsearch"]

CMD []
