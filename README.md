# ELK Docker Containers

This repo contains the configuration files and Dockerfiles to build individual Elasticsearch, Logstash and Kibana containers with a lightweight Alpine based image. You can use Docker Compose to build and run the containers. 

**Table of Contents**

- [Prerequisites](#prerequisites)
- [Up and Running](#up-and-running)
- [Mounted Volumes and Configurations](#mounted-volumes-and-configurations)
  - [Updating Logstash.conf](#updating-logstashconf)
  - [Data Persistance](#data-persistance)
  - [Enabling HTTPS](#enabling-https)
- [Notes](#notes)
  - [Resources](#resources)

## Up and Running

You will need to have [Docker](https://docs.docker.com) and [Docker Compose](https://docs.docker.com/compose/install/) installed.

Create a Logstash configuration file and start the containers:

```
cp logstash/assets/logstash-template.conf  logstash/assets/logstash.conf
docker-compose up -d
```

Once you start sending events to Logstash, you can connect to Kibana on port 80 of your host and configure an index pattern.

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

## Notes

I added a `tty=true` to the Logstash launch options because it kept immediately shutting down after start up completed.

__Elasticsearch vm_max_map_count__

The `vm_max_map_count` kernel setting needs to be set to at least `262144`. Update `/etc/sysctl.conf` with the following line:

```
vm.max_map_count=262144
```

Or issue the command from the terminal as root

```
sysctl -w vm.max_map_count=262144
```

