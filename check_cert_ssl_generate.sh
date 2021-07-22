#!/bin/bash

cert_ssl=$1
key_ssl=$2
if [[ $# -eq 0 ]]
then
	echo "Arguments not given. Usage: ./checkcert.sh CERTIFICATE.crt PRIVKEY.key"
else
	crthash=$(openssl x509 -noout -modulus -in "$cert" | openssl md5)
	echo $cert $crthash
	keyhash=$(openssl rsa -noout -modulus -in "$key" | openssl md5)
	if [ "$keyhash" = "$crthash" ]
	then
    	keytest=$(openssl rsa -in "$key" -check -noout)
    	echo $key $keyhash
    	echo "---- "$keytest" ----"
	else
    	echo "!!!! Invalid key for given cert !!!!"
	fi
fi
