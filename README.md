# elk
# Elasticsearch version 7
Download repo from git

> git clone https://github.com/tainguyenbp/elk.git<br>
> cd elk<br>
* Run file bash start docker compose with three es<br>
Run command execute script install kubernetes master
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
