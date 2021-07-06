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
