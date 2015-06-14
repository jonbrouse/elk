# ELK Docker Containers
This repo contains the configuration files and Dockerfiles to build individual Logpsout, Elasticsearch, Logstash and Kibana containers. You can use Docker compose to build and run the containers. Logspout listens to the "Docker logs" from each container and sends them to Logstash.  

## Up and Running
Build the containers

    docker-compose build

Run the containers

    docker-compose up -d

## Versions
Elasticsearch and Logstash containers are built with a [Java 8 container from my Docker Hub account.](https://registry.hub.docker.com/u/jonbrouse/docker-java/dockerfile/)

 - Elasticsearch Version 1.51
 - Logstash Version 1.50
 - Kibana Version 4.0.2

## Listening Ports 
 - Elasticsearch: 9200, 9200
 - Logstash: 5000
 - Kibana: 5601


## Notes
I added a `tty=true` to the Logstash launch options because it kept immediately shutting down after start up completed. 

### Resources

I used the following resources when creating this stack:
- [Nathan LeClaire's Automating Docker Logging](http://nathanleclaire.com/blog/2015/04/27/automating-docker-logging-elasticsearch-logstash-kibana-and-logspout/)
- [Evan Hazlett's Logging with ELK and Docker](http://evanhazlett.com/2014/11/Logging-with-ELK-and-Docker/) 
