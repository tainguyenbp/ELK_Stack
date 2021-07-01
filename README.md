# elk
# Elasticsearch version 7
Download repo from git
> git clone https://github.com/tainguyenbp/elk.git<br>

Run file bash start docker compose with three es
> cd elk<br>
> bash run_elk_docker_compose.sh<br>

Testing Elasticsearch
> root@docker-elk:/home/sysadmin/elk# curl http://127.0.0.1:9200/_cluster/health?pretty<br>
> {<br>
>   "cluster_name" : "es-docker-cluster",<br>
>   "status" : "green",<br>
>   "timed_out" : false,<br>
>   "number_of_nodes" : 3,<br>
>   "number_of_data_nodes" : 3,<br>
>   "active_primary_shards" : 0,<br>
>   "active_shards" : 0,<br>
>   "relocating_shards" : 0,<br>
>   "initializing_shards" : 0,<br>
>   "unassigned_shards" : 0,<br>
>   "delayed_unassigned_shards" : 0,<br>
>   "number_of_pending_tasks" : 0,<br>
>   "number_of_in_flight_fetch" : 0,<br>
>   "task_max_waiting_in_queue_millis" : 0,<br>
>   "active_shards_percent_as_number" : 100.0<br>
> }<br>

Ingest a document to elasticsearch:
> root@docker-elk:/home/sysadmin/elk# curl -H "Content-Type: application/json" -XPUT http://127.0.0.1:9200/test/docs/1 -d '{"name": "tainguyenbp"}'<br>
> {"_index":"test","_type":"docs","_id":"1","_version":1,"result":"created","_shards":{"total":2,"successful":2,"failed":0},"_seq_no":0,"_primary_term":1}<br>

View the indices:
> root@docker-elk:/home/sysadmin/elk# curl http://127.0.0.1:9200/_cat/indices?v<br>
> health status index uuid                   pri rep docs.count docs.deleted store.size pri.store.size<br>
> green  open   test  ogdfWsbsTYqc3s8wISRGgA   1   1          0            0       416b           208b<br>
