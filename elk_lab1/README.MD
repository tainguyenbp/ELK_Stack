# elk
# Elasticsearch version 7
1. Run a single node test with docker
> docker run -it -d \<br>
> -p 9200:9200 -p 9300:9300 \<br>
> -e "discovery.type=single-node" --name es_single \<br>
> docker.elastic.co/elasticsearch/elasticsearch:7.13.2<br>

2. Run a single node test with docker, using host network
> docker run -it -d \<br>
> -p 9200:9200 -p 9300:9300 \<br>
> --net=host \<br>
> -e "discovery.type=single-node" --name es_single \<br>
> docker.elastic.co/elasticsearch/elasticsearch:7.13.2<br>

3. Run a single node test with docker, using host network

