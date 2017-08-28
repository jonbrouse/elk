FROM java:8-alpine

RUN apk add --no-cache bash curl tar fontconfig freetype && \
    addgroup -g 750 -S kibana && \
    adduser -u 750 -D -S -G kibana kibana

ENV HOME_DIR /usr/share/kibana
ENV KIBANA_VERSION 5.5.2

WORKDIR ${HOME_DIR}

RUN curl -Ls https://artifacts.elastic.co/downloads/kibana/kibana-${KIBANA_VERSION}-linux-x86_64.tar.gz | tar zx --strip-components=1 && \
    sed -i '/DIR=/c\DIR="\/usr\/share\/kibana"' bin/kibana bin/kibana-plugin

RUN echo /usr/share/kibana/bin:/usr/share/kibana/node/bin:$PATH > /etc/profile.d/kibana

COPY assets/kibana.yml /opt/kibana/config/kibana.yml

RUN chown -R kibana:kibana ${HOME_DIR} ${HOME_DIR}/*

USER kibana

EXPOSE 5601

RUN /usr/share/kibana/bin/kibana-plugin install x-pack

ENTRYPOINT ["/usr/share/kibana/bin/kibana"]

CMD []
