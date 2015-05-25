# ELK Docker Containers
This repo contains the configuration files and Dockerfiles to build individual Elasticsearch, Logstash and Kibana containers. You can use Docker compose to build and run the containers. 

## Up and Running
Build the containers

    docker-compose build

Run the containers

    docker-compose up -d

## Versions
Elasticsearch and Logstash containers are built with a [Java 8](https://registry.hub.docker.com/u/jonbrouse/docker-java/dockerfile/) container from my repo.

 - Elasticsearch Version 1.51
 - Logstash Version 1.50
 - Kibana Version 4.0.2

## Port Usage 
 - Elasticsearch: http://${host}:[9200,9200]
 - Logstash: http://${host}:5000
 - Kibana: http://${host}:5601


## Notes
I added a `tty=true` to the Logstash launch options because it kept immediately shutting down after start up completed. 
