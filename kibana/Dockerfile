FROM debian:jessie
MAINTAINER Jon Brouse @jonbrouse

ENV VERSION 4.0.2

RUN apt-get update && \
    apt-get install -y curl && \
    apt-get autoclean && \
    apt-get --purge -y autoremove

WORKDIR /opt

RUN curl -O https://download.elastic.co/kibana/kibana/kibana-${VERSION}-linux-x64.tar.gz && \
    tar -xvf kibana-${VERSION}-linux-x64.tar.gz && \
    rm -rf kibana-${VERSION}-linux-x64.tar.gz && \
    ln -s kibana-${VERSION}-linux-x64 kibana

COPY assets/kibana.yml /opt/kibana/kibana/config/kibana.yml

EXPOSE 5601

ENTRYPOINT ["/opt/kibana/bin/kibana"]

CMD []
