RSYSLOG_SyslogProtocol23Format
<%PRI%>1 %TIMESTAMP:::date-rfc3339% %HOSTNAME% %APP-NAME% %PROCID% %MSGID% %STRUCTURED-DATA% %msg%\n"

template(name="myFormat" type="string"
   string="<%PRI%>1 %TIMESTAMP:::date-rfc3339% %fromhost% %APP-NAME% %PROCID% %MSGID% %STRUCTURED-DATA% %msg%\n")
*.* @@(o)dest.syslog.example.com:6514;myFormat

Config with no (o):
*.* @@127.0.0.1:6514;RSYSLOG_SyslogProtocol23Format
Produces (RFC5424 output):
<30>1 2018-08-01T11:16:08.529324-06:00 hilldale systemd 1 - -  Started System Logging Service.

Config with (o):
*.* @@(o)127.0.0.1:6514;RSYSLOG_SyslogProtocol23Format
Produces (RFC5425 output):
95 <30>1 2018-08-01T11:12:29.276656-06:00 hilldale systemd 1 - -  Started System Logging Service.
