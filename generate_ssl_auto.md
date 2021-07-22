### Generating SSL Certificates using Let's Encrypt
* Setup a real domain with an SSL certificate from Let’s Encrypt.
* Prereq: Own a Domain
* Documentaion
    - [Let's Encrypt](https://letsencrypt.org/)
    - Cerbot (https://certbot.eff.org/)
* Seting a domain for binarybutter.com. DNS records are as follows
    ```DNS
    NAME    TYPE    DATA
    @       A       MY_PUBLIC_IP_ADDRESS
    www     CNAME   binarybutter.com
    ```
#### Certbot (This section is focused on Nginx)
* Certbot is used to automate the SSL certificate generation.
* Prereq:
    - VM with centos in it.
    - nginx should be installed
    - ```epel-release``` should be activated.
* Install ```certbot-nginx``` which gives us ```certbot``` and a plugin to communicate with nginx.
* The certbot NGINX plugin will allow it to make modifications to our NGINX configuration for us and restart the server.
* For example lets create a custom configuration in nginx.
    ```
    $ vim /etc/nginx/conf.d/binarybutter.com.conf

    server {
        listen 80;
        server_name binarybutter.com www.binarybutter.com;

        location / {
            root /usr/share/nginx/html;
            index index.html;
        }
    }
    ```
* Run the below command to ```Generate certificates```
    ```
    $ certbot --nginx -d binarybutter.com -d www.binarybutter.com
    ```
* Answer the prompts. Finally we will have a new configuration that will force SSL automatically. Final configuration looks like
    ```shell
    $ cat /etc/nginx/conf.d/binarybutter.com.conf

    # Output:

    server {
        server_name chord.tools www.chord.tools;

        location / {
            root /usr/share/nginx/html;
            index index.html;
        }

        listen 443 ssl; # managed by Certbot
        ssl_certificate /etc/letsencrypt/live/chord.tools/fullchain.pem; # managed by Certbot
        ssl_certificate_key /etc/letsencrypt/live/chord.tools/privkey.pem; # managed by Certbot
        include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
        ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
    }

    server {
        if ($host = www.chord.tools) {
            return 301 https://$host$request_uri;
        } # managed by Certbot

        if ($host = chord.tools) {
            return 301 https://$host$request_uri;
        } # managed by Certbot

        listen 80;
        server_name chord.tools www.chord.tools;
        return 404; # managed by Certbot
    }
    ```
#### Renewing certificates automatically
* certbot renew command will check which certificates on the server need to be renewed soon and fetch new ones.
* certbot has already created a ```certbot-renew``` systemd service and timer (found at ```/lib/systemd/system/certbot-renew.{service,timer})```
* In order to reload nginx after the certificate is renewd we need to modify a small configurtaion (By default certbot restarts apache)
    ```
    $ vim /etc/sysconfig/certbot

    POST_HOOK="--post-hook 'systemctl reload nginx'"
    ```
* Finally enable the certbot service and the timer
    ```
    $ systemctl start certbot-renew
    $ systemctl enable certbot-renew
    $ systemctl start certbot-renew.timer
    $ systemctl enable certbot-renew.timer
    ```
{"mode":"full","isActive":false}
