#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


docker run -it -d \
--net=host \
-e "discovery.type=single-node" --name es_single \
docker.elastic.co/elasticsearch/elasticsearch:7.13.2

