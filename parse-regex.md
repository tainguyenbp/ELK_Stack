RSYSLOG_SyslogProtocol23Format
<%PRI%>1 %TIMESTAMP:::date-rfc3339% %HOSTNAME% %APP-NAME% %PROCID% %MSGID% %STRUCTURED-DATA% %msg%\n"

template(name="myFormat" type="string"
   string="<%PRI%>1 %TIMESTAMP:::date-rfc3339% %fromhost% %APP-NAME% %PROCID% %MSGID% %STRUCTURED-DATA% %msg%\n")
*.* @@(o)dest.syslog.example.com:6514;myFormat
