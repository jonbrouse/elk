FROM openjdk:8u131-jre-alpine

# Install bash to support scripts written by elasticsearch
RUN apk add --no-cache bash curl tar && \
    addgroup -g 750 -S elasticsearch && \
    adduser -u 750 -D -S -G elasticsearch elasticsearch 

ENV HOME_DIR /usr/share/elasticsearch
ENV VERSION 5.5.2

WORKDIR ${HOME_DIR}

RUN curl -fsSL https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-${VERSION}.tar.gz | tar zx --strip-components=1 && \
    mkdir -p config data logs

# https://www.elastic.co/guide/en/elasticsearch/plugins/current/repository-s3.html
RUN ./bin/elasticsearch-plugin install --batch repository-s3 

# Other plugins - x-pack ingest-user-agent ingest-geoip
#for PLUGIN in x-pack ingest-user-agent ingest-geoip; do elasticsearch-plugin install --batch "$PLUGIN"; done

COPY assets/elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml

RUN chown -R elasticsearch:elasticsearch ${HOME_DIR}/*

USER elasticsearch

EXPOSE 9200/tcp 9300/tcp

ENTRYPOINT ["/usr/share/elasticsearch/bin/elasticsearch"]

CMD []
