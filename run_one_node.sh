#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p "$CURRENT_DIR"/es-01

docker run -it -d \
--net=host \
-e "discovery.type=single-node" --name es_single_copy_data \
docker.elastic.co/elasticsearch/elasticsearch:7.13.2

docker cp es_single_copy_data:/usr/share/elasticsearch/config "$CURRENT_DIR"/es-01/
docker cp es_single_copy_data:/usr/share/elasticsearch/data "$CURRENT_DIR"/es-01/

docker rm -f es_single_copy_data

docker run -it -d \
--net=host \
-v "$CURRENT_DIR"/es-01/config:/usr/share/elasticsearch/config \
-v "$CURRENT_DIR"/es-01/data:/usr/share/elasticsearch/data \
-e "discovery.type=single-node" --name es_single \
docker.elastic.co/elasticsearch/elasticsearch:7.13.2
