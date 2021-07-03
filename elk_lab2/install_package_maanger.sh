#!/bin/bash

wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | sudo apt-key add -

echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list

sudo apt-get update -y
sudo apt-get install elasticsearch

curl -X GET http://127.0.0.1:9200/

curl -X GET http://127.0.0.1:9200/_cluster/health

curl -X GET http://127.0.0.1:9200/_cluster/health?pretty
