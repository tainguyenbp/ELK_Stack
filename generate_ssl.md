# openssl


### Install

Install the OpenSSL on Debian based systems

```sh
sudo apt-get install openssl
```


### Commands

Create a private key

```sh
openssl genrsa -out server.key 4096
```


Generate a new private key and certificate signing request

```sh
openssl req -out server.csr -new -newkey rsa:4096 -nodes -keyout server.key
```


Generate a self-signed certificate

```sh
openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:4096 -keyout server.key -out server.crt
```


Generate a certificate signing request (CSR) for an existing private key

```sh
openssl req -out server.csr -key server.key -new
```


Generate a certificate signing request based on an existing certificate

```sh
openssl x509 -x509toreq -in server.crt -out server.csr -signkey server.key
```


Remove a passphrase from a private key

```sh
openssl rsa -in server.pem -out newserver.pem
```


Parse a list of revoked serial numbers

```sh
openssl crl -inform DER -text -noout -in list.crl
```


Check a certificate signing request (CSR)

```sh
openssl req -text -noout -verify -in server.csr
```


Check a private key

```sh
openssl rsa -in server.key -check
```


Check a public key

```sh
openssl rsa -inform PEM -pubin -in pub.key -text -noout
openssl pkey -inform PEM -pubin -in pub.key -text -noout
```


Check a certificate

```sh
openssl x509 -in server.crt -text -noout
openssl x509 -in server.cer -text -noout
```


Check a PKCS#12 file (.pfx or .p12)

```sh
openssl pkcs12 -info -in server.p12
```


Verify a private key matches an certificate

```sh
openssl x509 -noout -modulus -in server.crt | openssl md5
openssl rsa -noout -modulus -in server.key | openssl md5
openssl req -noout -modulus -in server.csr | openssl md5
```


Display all certificates including intermediates

```sh
openssl s_client -connect www.paypal.com:443
```


Convert a DER file (.crt .cer .der) to PEM

```sh
openssl x509 -inform der -in server.cer -out server.pem
```


Convert a PEM file to DER

```sh
openssl x509 -outform der -in server.pem -out server.der
```


Convert a PKCS#12 file (.pfx .p12) containing a private key and certificates to PEM

```sh
openssl pkcs12 -in server.pfx -out server.pem -nodes
```


Convert a PEM certificate file and a private key to PKCS#12 (.pfx .p12)

```sh
openssl pkcs12 -export -out server.pfx -inkey server.key -in server.crt -certfile CACert.crt
```


Generate a Diffie Hellman key

```sh
openssl dhparam -out dhparam.pem 2048
```


Encrypt files with rsautl

```sh
openssl rsautl -encrypt -in plaintext.txt -out encrypted.txt -pubin -inkey pubkey.pem
```


Decrypt files with rsautl

```sh
openssl rsautl -decrypt -in encrypted.txt -out plaintext.txt -inkey privkey.pem
```
