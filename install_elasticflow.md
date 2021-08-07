### Install Elasticsearch

```
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

sudo apt-get install apt-transport-https

echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list

sudo apt-get update
sudo apt-get install elasticsearch=7.8.1



Download and install the Debian package manuallyedit
The Debian package for Elasticsearch v7.8.1 can be downloaded from the website and installed as follows:

mdkir -p /home/tainguyenbp/elasticsearch
cd /home/tainguyenbp/elasticsearch
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.8.1-amd64.deb
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.8.1-amd64.deb.sha512
shasum -a 512 -c elasticsearch-7.8.1-amd64.deb.sha512
-> elasticsearch-7.8.1-amd64.deb: OK

sudo dpkg -i elasticsearch-7.8.1-amd64.deb

sudo systemctl enable elasticsearch.service
sudo systemctl start elasticsearch.service
sudo systemctl stop elasticsearch.service

```
### Configurage Elasticsearch

```

```

### Install Kibana

```
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
Install from the APT repository
You may need to install the apt-transport-https package on Debian before proceeding:

sudo apt-get install apt-transport-https

Save the repository definition to /etc/apt/sources.list.d/elastic-7.x.list:

echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
echo "deb https://artifacts.elastic.co/packages/oss-7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list

sudo apt-get update && sudo apt-get install kibana=7.8.1

Download and install the Debian package manually
The Debian package for Kibana v7.8.1 can be downloaded from the website and installed as follows:

wget https://artifacts.elastic.co/downloads/kibana/kibana-7.8.1-amd64.deb
shasum -a 512 kibana-7.8.1-amd64.deb 
sudo dpkg -i kibana-7.8.1-amd64.deb

sudo systemctl enable kibana.service
sudo systemctl start kibana.service
sudo systemctl stop kibana.service


```

### Configurage Kibana

```

```


### Install Logstash
```

Logstash requires Java 8 or Java 11. Use the official Oracle distribution or an open-source distribution such as OpenJDK.

sudo apt install openjdk-8-jdk openjdk-8-jre
java -version

Installing from Package Repositories
APT
Download and install the Public Signing Key:

wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

You may need to install the apt-transport-https package on Debian before proceeding:

sudo apt-get install apt-transport-https

Save the repository definition to /etc/apt/sources.list.d/elastic-7.x.list:

echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt-get update && sudo apt-get install logstash=7.8.1-amd64

wget https://artifacts.elastic.co/downloads/logstash/logstash-7.8.1.deb
shasum -a 512 -c logstash-7.8.1.deb.sha512
sudo dpkg -i logstash-7.8.1.deb

sudo systemctl enable logstash.service
sudo systemctl start logstash.service
sudo systemctl stop logstash.service

````
### Configurage Logstash
```
/usr/share/logstash/bin/logstash-plugin install logstash-codec-sflow

/usr/share/logstash/bin/logstash-plugin update

sudo /usr/share/logstash/bin/logstash-plugin install logstash-codec-sflow
sudo /usr/share/logstash/bin/logstash-plugin update logstash-codec-netflow
sudo /usr/share/logstash/bin/logstash-plugin update logstash-input-udp
sudo /usr/share/logstash/bin/logstash-plugin update logstash-input-tcp
sudo /usr/share/logstash/bin/logstash-plugin update logstash-filter-dns
sudo /usr/share/logstash/bin/logstash-plugin update logstash-filter-geoip
sudo /usr/share/logstash/bin/logstash-plugin update logstash-filter-translate

sudo wget https://github.com/robcowart/elastiflow/archive/refs/tags/v4.0.1.tar.gz
tar xzvf v4.0.1.tar.gz
cp -a elastiflow-4.0.1/logstash.service.d/. /etc/systemd/system/logstash.service.d/
cp -a elastiflow-4.0.1/logstash/elastiflow/. /etc/logstash/elastiflow

```
### Configurage Logstash file logstash.yml
```
comment all config logstash
```

### Configurage Logstash file pipelines.yml
```
vim /etc/logstash/pipelines.yml
- pipeline.id: elastiflow
  path.config: "/etc/logstash/elastiflow/conf.d/*.conf"
```

### Update GeoLite2-City and GeoLite2-Coutry
```
URL1
wget https://git.io/GeoLite2-ASN.mmdb
wget https://git.io/GeoLite2-City.mmdb  
wget

URL2
wget  
wget 
wget 
```

### enable only netflow logstash configuration
```
cd /etc/logstash/elastiflow/conf.d/
mv 10_input_ipfix_ipv4.logstash.conf.disabled 10_input_ipfix_ipv4.logstash.conf
mv 30_output_10_single.logstash.conf 30_output_10_single.logstash.conf.disabled
mv 30_output_20_multi.logstash.conf.disabled 30_output_20_multi.logstash.conf
```

### Restart the Logstash Service
```
/usr/share/logstash/bin/system-install
systemctl daemon-reload
systemctl restart logstash
```

### Tune Linux for improved UDP Throughput
```
Add below line at the end of file in /etc/sysctl.conf
vim /etc/sysctl.conf

net.core.rmem_max=33554432

sysctl -p

```

### Import ElastiFlow Dashboard in KibanaPermalink
```
# find template dashboard elastiflow.kibana.7.8.x.ndjson
cd elastiflow-4.0.1/kibana/
ls -lah

# Copy dashboard kibana to desktop and select import dashboard template elastiflow.kibana.7.8.x.ndjson via kiabana
Management > Kibana Section > Saved Objects > Import


```
