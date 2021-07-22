## Generate a private key and a CSR(Certificate Signing Request )
Use this method if you want to use HTTPS (HTTP over TLS) to secure your Apache HTTP or Nginx web server, and you want to use a Certificate Authority (CA) to issue the SSL certificate. The CSR that is generated can be sent to a CA to request the issuance of a CA-signed SSL certificate. If your CA supports SHA-2, add the -sha256 option to sign the CSR with SHA-2.

Creating a 2048-bit private key (domain.key) and a CSR (domain.csr) from scratch:

```
openssl req -newkey rsa:2048 -nodes -keyout domain.key -out domain.csr
```

Creating a 2048-bit private key and public key
```
openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout /etc/nginx/ssl/private.key \
  -out /etc/nginx/ssl/public.pem
```
Command Explanation:
```
req - We’re making a certificate request to OpenSSL
-x509 - Specifying the structure that our certificate should have. Conforms to the X.509 standard
-nodes - Do not encrypt the output key
-days 365 - Set the key to be valid for 365 days
-newkey rsa:2048 - Generate an RSA key that is 2048 bits in size
-keyout /etc/nginx/ssl/private.key - File to write the private key to
-out /etc/nginx/ssl/public.pem - Output file for public portion of key
-new option, which is not included here but implied, indicates that a CSR is being generated.
```
After running the above command answer the CSR information
<pre><code>
Country Name (2 letter code) [AU]:US
State or Province Name (full name) [Some-State]:New York
Locality Name (eg, city) []:Brooklyn
Organization Name (eg, company) [Internet Widgits Pty Ltd]:Example Brooklyn Company
Organizational Unit Name (eg, section) []:Technology Division
Common Name (e.g. server FQDN or YOUR name) []:examplebrooklyn.com
Email Address []:</pre></code>

Non interactively answer CSR
<pre><code>-subj "/C=US/ST=New York/L=Brooklyn/O=Example Brooklyn Company/CN=examplebrooklyn.com"</pre></code>

# Generate a CSR from an Existing Private Key
This command creates a new CSR (domain.csr) based on an existing private key (domain.key):
<pre><code>openssl req -key domain.key -new -out domain.csr</pre></code>
Answer the CSR information prompt to complete the process.

1. -key option specifies an existing private key (domain.key) that will be used to generate a new CSR.
2. -new option indicates that a CSR is being generated.

# Generate a CSR from an Existing Certificate and Private Key
This command creates a new CSR (domain.csr) based on an existing certificate (domain.crt) and private key (domain.key):
<pre><code>openssl x509 -in domain.crt -signkey domain.key -x509toreq -out domain.csr</pre></code>
The -x509toreq option specifies that you are using an X509 certificate to make a CSR.

## Generating SSL Certificates
# Generate a Self-Signed Certificate
This command creates a 2048-bit private key (domain.key) and a self-signed certificate (domain.crt) from scratch:
<pre><code>openssl req -newkey rsa:2048 -nodes -keyout domain.key -x509 -days 365 -out domain.crt</pre></code>
Answer the CSR information prompt to complete the process.

1. -x509 option tells req to create a self-signed cerificate.
2. -days 365 option specifies that the certificate will be valid for 365 days. A temporary CSR is generated to gather information to associate with the certificate.

# Generate a Self-Signed Certificate from an Existing Private Key
This command creates a self-signed certificate (domain.crt) from an existing private key (domain.key):
<pre><code>openssl req -key domain.key -new -x509 -days 365 -out domain.crt</pre></code>
Answer the CSR information prompt to complete the process.
1. -x509 option tells req to create a self-signed cerificate.
2. 365 option specifies that the certificate will be valid for 365 days.
3. -new option enables the CSR information prompt.

# Generate a Self-Signed Certificate from an Existing Private Key and CSR
This command creates a self-signed certificate (domain.crt) from an existing private key (domain.key) and (domain.csr):
<pre><code>openssl x509 -signkey domain.key -in domain.csr -req -days 365 -out domain.crt</pre></code>

# View Certificates
Certificate and CSR files are encoded in PEM format, which is not readily human-readable.

This section covers OpenSSL commands that will output the actual entries of PEM-encoded files.

# View CSR Entries
This command allows you to view and verify the contents of a CSR (domain.csr) in plain text:
<pre><code>openssl req -text -noout -verify -in domain.csr</pre></code>
# View Certificate Entries
This command allows you to view the contents of a certificate (domain.crt) in plain text:
<pre><code>openssl x509 -text -noout -in domain.crt</pre></code>
# Verify a Certificate was Signed by a CA
Use this command to verify that a certificate (domain.crt) was signed by a specific CA certificate (ca.crt):
<pre><code>openssl verify -verbose -CAFile ca.crt domain.crt</pre></code>
## Private Keys
This section covers OpenSSL commands that are specific to creating and verifying private keys.
# Create a Private Key
Use this command to create a password-protected, 2048-bit private key (domain.key):
<pre><code>openssl genrsa -des3 -out domain.key 2048</pre></code>
Enter a password when prompted to complete the process.

# Verify a Private Key
Use this command to check that a private key (domain.key) is a valid key:
<pre><code>openssl rsa -check -in domain.key</pre></code>
If your private key is encrypted, you will be prompted for its pass phrase. Upon success, the unencrypted key will be output on the terminal.

# Verify a Private Key Matches a Certificate and CSR
Use these commands to verify if a private key (domain.key) matches a certificate (domain.crt) and CSR (domain.csr):
<pre><code>
openssl rsa -noout -modulus -in domain.key | openssl md5
openssl x509 -noout -modulus -in domain.crt | openssl md5
openssl req -noout -modulus -in domain.csr | openssl md5
</pre></code>
If the output of each command is identical there is an extremely high probability that the private key, certificate, and CSR are related.

# Encrypt a Private Key
This takes an unencrypted private key (unencrypted.key) and outputs an encrypted version of it (encrypted.key):
<pre><code>
openssl rsa -des3 -in unencrypted.key -out encrypted.key</pre></code>
Enter your desired pass phrase, to encrypt the private key with.
# Decrypt a Private Key
This takes an encrypted private key (encrypted.key) and outputs a decrypted version of it (decrypted.key):
<pre><code>openssl rsa -in encrypted.key -out decrypted.key</pre></code>
Enter the pass phrase for the encrypted key when prompted.

Reference [link](https://www.digitalocean.com/community/tutorials/openssl-essentials-working-with-ssl-certificates-private-keys-and-csrs)

-----------------------------------------------------------------
* To Show the certificate

openssl s_client -connect example.com:443


* Import a certificate
```
openssl s_client -connect example.com:443 < /dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > example.com.crt
```
* If you face any issue (Ex: -bash: /dev/null : No such file or directory) try it in the below way

1. Import the certificate
```
openssl s_client -connect example.com:443 > example.com.txt

```
2. Check if the certificate is present or not
```
cat example.com.txt | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p'
```
3. Copy the certificate part to a .crt file
```
cat example.com.txt | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' | tee example.crt
```
4. verify it
```
cat example.com.crt
```
5. Change the password of a pfx file

- Export you current certificate to a passwordless pem type
```
openssl pkcs12 -in example.com.pfx -out example.com.pem -nodes
```
- Convert the passwordless pem to a new pfx file with password:
```
openssl pkcs12 -export -name example.com.pfx -out example.com.pfx -in example.com.pem
```
or
```
openssl pkcs12 -export -out domain.name.pfx -inkey domain.name.key -in domain.name.crt
```
  - The key file is just a text file with your private key in it.

  - If you have a root CA and intermediate certs, then include them as well using multiple -in params
```
openssl pkcs12 -export -out domain.name.pfx -inkey domain.name.key -in domain.name.crt -in intermediate.crt -in rootca.crt
```
--------------------------------------------------------------

### Java keytool

#### TrustStore vs keyStore:
 Main difference between trustStore vs keyStore is that trustStore (as name suggest) is used to store certificates from trusted Certificate authorities(CA) which are used to verify certificate presented by Server in SSL Connection while keyStore is used to store private key and own identity certificate which program should present to other parties (Server or client) to verify its identity. That was one liner difference between trustStore vs  keyStore in Java but no doubt these two terms are quite a confusion not just for anyone who is the first time doing SSL connection in Java but also many intermediate and senior level programmer. One reason of this could be SSL setup being a one-time job and not many programmers get opportunity to do that. In this Java article, we will explore both keystore and trust stores and understand key differences between them. By the way, you can use a keytool command to view certificates from truststore and keystore. keytool command comes with Java installation and its available in the bin directory of JAVA_HOME.
 
 [Reference click here](http://www.java67.com/2012/12/difference-between-truststore-vs.html)
 
 ##### Starting the application server with the keystores
 ```
  -Djavax.net.ssl.keyStore=%CLIENT_CERT% 
  -Djavax.net.ssl.keyStorePassword=endeca 
  -Djavax.net.ssl.trustStore=%CLIENT_CERT% 
  -Djavax.net.ssl.trustStorePassword=endeca
 ```

#### Create a Truststore

```
keytool -import -alias alias-ofthe-cert -file cert-name.com.cer -storetype JKS -keystore testTruststore
```
#### Update keystore with a certificate

```
keytool  -import -file <cert_name>.cer -alias <alias_name_to_identify_inside_truststore.github.com> -keystore <trustorefile_name> 
```
#### Delete keystore cert
```
keytool -delete -alias <alias_name_of_the_cert_in_keystore.github.com> -keystore <keystore_name>
```
#### List keystore
```
keytool -list -v -keystore <keystore_name>
```
#### Delete a certificate from a Java Keytool keystore
```
keytool -delete -alias mydomain -keystore keystore.jks
```
#### Change a Java keystore password
```
keytool -storepasswd -new new_storepass -keystore keystore.jks
```
#### Export a certificate from a keystore
```
keytool -export -alias mydomain -file mydomain.crt -keystore keystore.jks
```
#### Check a stand-alone certificate
```
keytool -printcert -v -file mydomain.crt
```
#### Generate a Java keystore and key pair
```
keytool -genkey -alias mydomain -keyalg RSA -keystore keystore.jks -keysize 2048
```
##### Options
 ```
 -storepass xxxxxx
 ```
##### Check Hashing Algorithm
```
openssl x509 -noout -text -in example.crt
```
##### Extract only the Hashing Algorithm
```
openssl x509 -noout -text -in example.crt | grep "Signature Algorithm" | uniq
```
##### Extract a server certificate
```
openssl s_client -showcerts -connect <HOST_IP>:443
```

### [Generating SSL Certificates using Let's Encrypt](https://gist.github.com/mohanpedala/3e5a9ab87ee4b58b5eff2e45b8af2584)
{"mode":"full","isActive":false}
