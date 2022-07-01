#!/bin/bash

backup_container() {
  SOURCE_CONTAINER="elk_elasticsearch_1"
  SOURCE_DIRECTORY="/opt/elasticsearch/data"
  BACKUP_FILE_NAME="$(date +%FT%T)-elasticsearch.tar"
  IMAGE="openjdk:8u131-jre-alpine"
  
  docker run --rm --volumes-from $SOURCE_CONTAINER -v $(pwd)/backup:/backup $IMAGE tar cvf /backup/$BACKUP_FILE_NAME $SOURCE_DIRECTORY
}

copy_logs() {
  BUCKET=""
  ARCHIIVE_DESTINATION="logs/archive/"
  DESTINATION="../cloudfront/"
  
  FILES=".2022-06-17*"

  aws s3 cp s3://$BUCKET/ $ARCHIIVE_DESTINATION  --recursive --exclude "*" --include "$FILES" 

  cd logs/archive && gunzip *.gz && mv * $DESTINATION
}

backup_container
#copy_logs
