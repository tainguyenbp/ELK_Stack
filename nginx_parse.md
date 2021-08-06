### Regular expression for parsing
```
(?P<ip>\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})?(?P<ip2>, \d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})?-? - ?\S* \[(?P<timestamp>\d{2}\/\w{3}\/\d{4}:\d{2}:\d{2}:\d{2} (\+|\-)\d{4})\]\s+\"(?P<method>\S{3,10}) (?P<path>\S+) HTTP\/1\.\d" (?P<response_status>\d{3}) (?P<bytes>\d+) "(?P<referer>(\-)|(.+))?" "(?P<useragent>.+)
```
### Nginx log format
```
'$remote_addr - $remote_user [$time_local] "$request" '
'$status $body_bytes_sent "$http_referer" '
'"$http_user_agent" "$request_time" "$upstream_response_time" "$http_x_forwarded_for" '
'"$http_client_ip" "$http_x_real_ip"';
```
