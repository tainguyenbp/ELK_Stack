# ELK LAB 1
# I. Run a single node test with docker
1. Run command with docker:
> docker run -it -d -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" --name es_single docker.elastic.co/elasticsearch/elasticsearch:7.13.2<br>

# II. Run a single node test with docker, using host network
1. Run command with docker:
> docker run -it -d -p 9200:9200 -p 9300:9300 --net=host -e "discovery.type=single-node" --name es_single docker.elastic.co/elasticsearch/elasticsearch:7.13.2<br>

# III. Run a single node test with docker, using host network and "persistent" Elasticsearch container config and data directory
1. Run command with docker:
> 
