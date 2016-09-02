FROM java:8-alpine

ENV HOME_DIR /opt
ENV VERSION 2.4.0
ENV LOGSTASH_PLUGINS $(curl -s https://api.github.com/orgs/logstash-plugins/repos\?per_page\=200 | perl -ne 'print "$1\n" if (/"name": "([^"]+)/)')

WORKDIR ${HOME_DIR}

RUN apk add --update bash curl perl tar && \
    curl -O https://download.elastic.co/logstash/logstash/logstash-${VERSION}.tar.gz && \
    tar -xvf logstash-${VERSION}.tar.gz && \
    rm -rf logstash-${VERSION}.tar.gz /var/cache/apk/* && \
    ln -s logstash-${VERSION} logstash

# Install every goddamn logtash plugin 
# WIP Needs pagination - https://developer.github.com/guides/traversing-with-pagination/
#RUN for i in $(curl -s https://api.github.com/orgs/logstash-plugins/repos\?per_page\=200 | perl -ne 'print "$1\n" if (/"name": "([^"]+)/)'); do /opt/logstash/bin/logstash-plugin install $i; done

ENV PATH=/opt/logstash/vendor/jruby/bin:$PATH

EXPOSE 5000

ENTRYPOINT ["/opt/logstash/bin/logstash"]

CMD []
