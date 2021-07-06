apt list --installed | grep elastic

mkdir /data

chown -R elasticsearch:elasticsearch /data

scp -r /etc/elasticsearch/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml.backup


cat <<EOF > /etc/elasticsearch/elasticsearch.yml
cluster.name: tainn-cluster
node.name: node-1
node.data: true
node.master: true
path.data: /data
path.logs: /var/log/elasticsearch
network.host: 10.xx.xx.xx
discovery.seed_hosts: ["10.xx.xx.xx", "10.xx.xx.xx", "10.xx.xx.xx"]
cluster.initial_master_nodes: ["10.xx.xx.xx", "10.xx.xx.xx", "10.xx.xx.xx"]
EOF

  systemctl restart elasticsearch
  systemctl enable elasticsearch

cat <<EOF > /etc/elasticsearch/elasticsearch.yml
cluster.name: tainn-cluster
node.name: node-2
node.data: true
node.master: true
path.data: /data
path.logs: /var/log/elasticsearch
network.host: 10.xx.xx.xx
discovery.seed_hosts: ["10.xx.xx.xx", "10.xx.xx.xx", "10.xx.xx.xx"]
cluster.initial_master_nodes: ["10.xx.xx.xx", "10.xx.xx.xx", "10.xx.xx.xx"]
EOF
  
  systemctl restart elasticsearch
  systemctl enable elasticsearch

cat <<EOF > /etc/elasticsearch/elasticsearch.yml
cluster.name: tainn-cluster
node.name: node-3
node.data: true
node.master: true  
path.data: /data
path.logs: /var/log/elasticsearch
network.host: 10.xx.xx.xx
discovery.seed_hosts: ["10.xx.xx.xx", "10.xx.xx.xx", "10.xx.xx.xx"]
cluster.initial_master_nodes: ["10.xx.xx.xx", "10.xx.xx.xx", "10.xx.xx.xx"]
EOF
  
  systemctl restart elasticsearch
  systemctl enable elasticsearch
  
readlink -f etcd.yam
  
##Install filebeat
  
filebeat_clear=`grep -v "#" /etc/filebeat/filebeat.yml | grep -v "^$"`
echo "$filebeat_clear" > /etc/filebeat/filebeat.yml

filebeat modules enable nginx

**List indexin Elasticsearch cluster:**
curl -XGET http://<IP>:9200/_cat/indices

**Search(~ query) all data:**
curl -X GET "http://<IP>:9200/<index_name>/_search?pretty" -H 'Content-Type: application/json' -d'{"query": {"match_all": {}}}'
  
**Get documentby id:**
curl -XGET http://<IP>:9200/<index_name>/_doc/<_id>?prettycurl -XGET http://<IP>:9200/<index_name>/_doc/<_id>
