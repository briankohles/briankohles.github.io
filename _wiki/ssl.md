## view the details of a CSR using opessl
`openssl req -noout -text -in server.csr`
`openssl x509 -text`

## Get SSL Cert info
`echo "" | /usr/bin/openssl s_client -connect <HOST>:<SSLPORT> -showcerts 2>/dev/null`
* get the base64 encoded section for the cert in question (probably the first one). Save this to a file (Cert.txt)

## You can display the contents of a PEM formatted certificate under Linux, using openssl:
`openssl x509 -in cert.pem -text`

## testing supported ssl version
`echo "" | /usr/bin/openssl s_client -connect <fqdn>:<port> -no_tls1 -no_ssl2 -no_ssl3 -no_tls1_1`
**options for above**
* ssl2/-ssl3/-tls1_2/-tls1_1/-tls1/-dtls1 -- ONLY use the listed protocol
* no_tls1_2/-no_tls1_1/-no_tls1/-no_ssl3/-no_ssl2 - TURN OFF the listed protocol(s)

## Verify CSR
`openssl req -in mycsr.csr -noout -text`
`openssl req -text -noout -verify -in cert.csr`
`openssl x509 -in *.cer -text -noout`

## Verify that the CER, KEY, & CSR all have matching MD5 
For a quick check you can just compare the *.cer & the *.csr
```
/usr/bin/openssl x509 -noout -modulus -in *.cer | /usr/bin/openssl md5
/usr/bin/openssl rsa -noout -modulus -in *.key | /usr/bin/openssl md5
/usr/bin/openssl req -noout -modulus -in *.csr | /usr/bin/openssl md5
```

## Get The AltDNS Names of a cert
`openssl s_client -connect website.com:443 | openssl x509 -noout -text | grep DNS:`
