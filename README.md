# elk
# Elasticsearch version 7
Download repo from git
* Download repo from git<br>
> git clone https://github.com/tainguyenbp/elk.git<br>
> cd elk<br>
* Run file bash start docker compose with three es<br>
* run command execute script install kubernetes master<br>
> bash run_elk_docker_compose.sh<br>

* Testing Elasticsearch<br>
> root@master01:/home/sysadmin/elk# curl http://127.0.0.1:9200/_cluster/health?pretty
> {
>   "cluster_name" : "es-docker-cluster",
>   "status" : "green",
>   "timed_out" : false,
>   "number_of_nodes" : 3,
>   "number_of_data_nodes" : 3,
>   "active_primary_shards" : 0,
>   "active_shards" : 0,
>   "relocating_shards" : 0,
>   "initializing_shards" : 0,
>   "unassigned_shards" : 0,
>   "delayed_unassigned_shards" : 0,
>   "number_of_pending_tasks" : 0,
>   "number_of_in_flight_fetch" : 0,
>   "task_max_waiting_in_queue_millis" : 0,
>   "active_shards_percent_as_number" : 100.0
> }
