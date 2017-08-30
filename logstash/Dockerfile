FROM openjdk:8u131-jre-alpine

RUN apk add --no-cache bash curl tar && \
    addgroup -g 750 -S logstash && \
    adduser -u 750 -D -S -G logstash logstash 

ENV HOME_DIR /usr/share/logstash
ENV VERSION 5.2.2

WORKDIR ${HOME_DIR}

RUN apk add --no-cache bash curl tar && \
    curl -fsSL https://artifacts.elastic.co/downloads/logstash/logstash-${VERSION}.tar.gz | tar zx --strip-components=1

# Install every goddamn logtash plugin 
# WIP Needs pagination - https://developer.github.com/guides/traversing-with-pagination/
#RUN for i in $(curl -s https://api.github.com/orgs/logstash-plugins/repos\?per_page\=200 | perl -ne 'print "$1\n" if (/"name": "([^"]+)/)'); do /opt/logstash/bin/logstash-plugin install $i; done
RUN /usr/share/logstash/bin/logstash-plugin install logstash-codec-cloudtrail
#ENV PATH=/opt/logstash/vendor/jruby/bin:$PATH

#COPY ./assets/logstash.yml /usr/share/logstash/config/logstash.yml

RUN chown -R logstash:logstash ${HOME_DIR} ${HOME_DIR}/*

USER logstash

EXPOSE 5000

ENTRYPOINT ["/usr/share/logstash/bin/logstash"]

CMD []
