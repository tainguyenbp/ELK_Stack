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


### Nginx logs to remote syslog
access_log syslog:server=10.125.40.29:514,facility=local7,tag=nginx,severity=info;
error_log syslog:server=10.125.40.29:514,facility=local7,tag=nginx,severity=error;

##### Templates #####
# Legacy format (OBSOLETE)
$template TraditionalFormatWithPRI,"%pri%: %timegenerated% %HOSTNAME% %syslogtag%%msg:::drop-last-lf%\n"

# Format and JSON
template(name="JSONFormat" type="list" option.jsonf="on") {
    property(outname="timestamp" name="timegenerated" format="jsonf")
    property(outname="hostname" name="hostname" format="jsonf")
    property(outname="application" name="app-name" format="jsonf")
    property(outname="msg" name="msg" format="jsonfr")
    constant(outname="@version" value="1" format="jsonf")
}

# Format as list
template(name="template1" type="list") {
    property(name="timegenerated")
    constant(value=" ")
    property(name="hostname")
    constant(value=" ")
    property(name="app-name")
    constant(value=" ")
    property(name="procid")
    constant(value=" ")
    property(name="msg")
    constant(value="\n")
}

# Format as string
template(name="template2" type="string"
    string="%TIMESTAMP:::date-rfc3339% %HOSTNAME% %syslogtag%%msg:::sp-if-no-1st-sp%%msg:::drop-last-lf%\n"
)
