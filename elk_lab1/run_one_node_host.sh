#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


docker run -it -d \
-p 9200:9200 -p 9300:9300 \
--net=host \
-e "discovery.type=single-node" --name es_single \
docker.elastic.co/elasticsearch/elasticsearch:7.13.2

curl -X GET http://127.0.0.1:9200/

curl -X GET http://127.0.0.1:9200/_cluster/health

curl -X GET http://127.0.0.1:9200/_cluster/health?pretty
