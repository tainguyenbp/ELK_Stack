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
