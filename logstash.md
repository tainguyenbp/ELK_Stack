# 1. pipeline logstash filebeat + fluentd -> logstash <pipeline> -> elasticsearch
```
input {
  filebeats {
    port => 5044
    host => "0.0.0.0"
  }
}

filter {
}

output {

if [kubernetes][namespace] != "nginxlb" {
  if [kubernetes][namespace] != "fluentd" {
  elasticsearch {
    hosts => ["elasticsearch:9200"]
    user => 'elastic'
    password => 'elastic'
    index => "logstashlb-%{+YYYY.MM.dd}-00001"
    ilm_enabled => true
    ilm_rollover_alias => "logstashlb"
    ilm_policy => "logstashlb"
  }
 }
}

if [kubernetes][namespace] == "nginxlb" {
  elasticsearch {
    hosts => ["elasticsearch:9200"]
    user => 'elastic'
    password => 'elastic'
    index => "nginxlb-%{+YYYY.MM.dd}-00001"
    ilm_enabled => true
    ilm_rollover_alias => "nginxlb"
    ilm_policy => "nginxlb"
  }
}

if [kubernetes][namespace] == "monitoring" {
  elasticsearch {
    hosts => ["elasticsearch:9200"]
    user => 'elastic'
    password => 'elastic'
    index => "monitoring-%{+YYYY.MM.dd}-00001"
    ilm_enabled => true
    ilm_rollover_alias => "monitoring"
    ilm_policy => "monitoring"
  }
}
```
