

### Update and remove password root emtry
```
mysql -uroot -p

use mysql;
uninstall plugin validate_password;
UPDATE mysql.user SET authentication_string=PASSWORD('tainn@123456'), plugin='mysql_native_password' WHERE User='root';
FLUSH PRIVILEGES;
```
