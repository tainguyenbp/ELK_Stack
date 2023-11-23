# How to Install Elastic Stack on Ubuntu 22.04 LTS
```
6  sudo apt-get update
7  sudo apt-get install ca-certificates curl gnupg
8  sudo install -m 0755 -d /etc/apt/keyrings
9  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
10  sudo chmod a+r /etc/apt/keyrings/docker.gpg
11  echo   "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
12  sudo apt-get update
13  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo docker run -d --restart always \
  --net="host" \
  --pid="host" \
  -v "/:/host:ro,rslave" \
  --name node_exporter \
  quay.io/prometheus/node-exporter:v1.7.0 \
  --path.rootfs=/host

sudo docker run -d --restart always --name cadvisor -p 8080:8080 -v "/:/rootfs:ro" -v "/var/run:/var/run:rw" -v "/sys:/sys:ro" -v "/var/lib/docker/:/var/lib/docker:ro" gcr.io/cadvisor/cadvisor:v0.47.2


/usr/share/elasticsearch/bin/elasticsearch-setup-passwords auto

/usr/share/elasticsearch/bin/elasticsearch-reset-password -u elastic

/usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana



cd /usr/share/elasticsearch/bin/
./elasticsearch-plugin install --batch repository-s3
./elasticsearch-keystore add s3.client.tainguyenbp.access_key
./elasticsearch-keystore add s3.client.tainguyenbp.secret_key
./elasticsearch-keystore add s3.client.tainguyenbp.endpoint




```
