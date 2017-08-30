# ELK Docker Containers
This repo contains the configuration files and Dockerfiles to build individual Elasticsearch, Logstash and Kibana containers with a lightweight Alpine based image. You can use Docker Compose to build and run the containers. 

## Prerequisites 

You will need to have [Docker](https://docs.docker.com) and [Docker Compose](https://docs.docker.com/compose/install/) installed.

__Elasticsearch vm_max_map_count__

The `vm_max_map_count` kernel setting needs to be set to at least `262144`. Update `/etc/sysctl.conf` with the following line:

```
vm.max_map_count=262144
```

Or issue the command from the terminal as root

```
sysctl -w vm.max_map_count=262144
```

## Up and Running
Create a Logstash configuration file:

      cp logstash/assets/logstash-template.conf  logstash/assets/logstash.conf

Start the containers:

    docker-compose up -d

Docker Compose creates an Nginx proxy container that is linked to the Kibana container. You can connect to it on port 80 of your host. You will need to send an event before we can "Configure an index pattern."

The default Logstash configuration creates a TCP input that listens on port 24642. You can manually send events to Logstash by issuing the following:

     echo -e "[Some Log Type][Data] This is our first event!" | nc localhost 24642

## Mounted Volumes and Configurations

### Updating Logstash.conf

This stack takes advantage of Volume mounting to facilitate quick configuration changes. When you make a change to ```logstash/assets/logstash.conf``` you can apply the change by restarting the container:

     docker-compose restart logstash

### Data Persistance 

In order for your Elasticsearch data to persist the data directory is mounted at:

    elasticsearch/volumes/esdata 

### Enabling HTTPS

You can quickly enable HTTPS on the Nginx container by adding your certs the ```nginx/assets/certs``` directory, updating the ```nginx/assets/default-ssl-example.conf``` file with your certificate names and making it the ```default.conf``` file:

    cp nginx/assets/default-ssl-example.conf nginx/assets/default.conf
    docker-compose restart nginx

## Versions
Elasticsearch, Logstash and Kibana containers are built with an official Java image.

 - Elasticsearch Version 2.3.0
 - Logstash Version 2.3.0
 - Kibana Version 4.5.0

## Notes
I added a `tty=true` to the Logstash launch options because it kept immediately shutting down after start up completed.

Elasticsearch is run as root, which is not recommended.

### Resources

I used the following resources when creating this stack:
- [Nathan LeClaire's Automating Docker Logging](http://nathanleclaire.com/blog/2015/04/27/automating-docker-logging-elasticsearch-logstash-kibana-and-logspout/)
- [Evan Hazlett's Logging with ELK and Docker](http://evanhazlett.com/2014/11/Logging-with-ELK-and-Docker/)
- [Groob's "A tiny Kibana DOcker container"](http://groob.io/posts/kibana-alpine/)
