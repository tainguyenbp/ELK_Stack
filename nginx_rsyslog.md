### Nginx logs to local syslog
### add to /etc/nginx/nginx.conf
access_log syslog:server=unix:/dev/log,facility=local7,tag=nginx,severity=info;
error_log syslog:server=unix:/dev/log,facility=local7,tag=nginx,severity=error;
nginx -t 
systemctl restart nginx

### add to file /etc/rsyslog.d/50-default.conf
local7.*  /var/log/nginx/nginx-rsyslog-local.log
rsyslogd -N1 => validate config

systemctl restart rsyslog
