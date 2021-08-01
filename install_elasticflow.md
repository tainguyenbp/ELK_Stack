### install with package

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

```
