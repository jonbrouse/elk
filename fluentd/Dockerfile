FROM debian:wheezy
MAINTAINER Jon Brouse @jonbrouse

# This will install the td-agent v2 from Treasure Data
# For more information see: fluentd.org/faqs
RUN apt-get update && \
    apt-get install -y curl && \
    curl https://packages.treasuredata.com/GPG-KEY-td-agent | apt-key add - && \
    echo "deb http://packages.treasuredata.com/2/debian/wheezy/ wheezy contrib" > /etc/apt/sources.list.d/treasure-data.list && \
    apt-get update && \
    apt-get --download-only install td-agent && \
    cp /var/cache/apt/archives/td-agent* . && \
    dpkg -x /var/cache/apt/archives/td-agent* . && \
    mkdir /var/log/td-agent && \
    apt-get autoclean && \
    apt-get --purge -y autoremove

COPY assets/td-agent.conf /opt/td-agent/etc/td-agent/td-agent.conf

ENTRYPOINT ["/opt/td-agent/embedded/bin/ruby"]

CMD []
