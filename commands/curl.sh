#!/bin/bash

#---curl---

  #Dual Authentication 
openssl pkcs12 -in keyStore.p12 -out keyStore.pem -nodes #Convert certificate from p12 to pem
curl -v -k --cert cert.pem -u takov:pass -X GET --header 'Accept: application/json' "https://10.10.10.10" #Authenticate 

  #FTP Authentication Pass only and Dual
curl -k -S --ftp-ssl --ftp-method singlecwd  -T pom.xml ftp://takov:pass@10.10.10.10 # Pass only 
curl -k  -v -S --ftp-ssl --ftp-method singlecwd --cert cert.pem -T kuna.p12 ftp://takov:pass@10.10.10.10 # Dual

    #FTP Upload with SITE META
curl -v  --user abv:123 --quote 'SITE META client=linux;user=vuser' -T file.txt ftp://10.10.10.10

    #Proxy
curl -v -x socks5://socks_user:socks_pass@10.10.10.10:1080 http://www.google.com/  #SOCKS Proxy
curl --proxy-user proxy_user:proxy_pass -x 10.10.10.10:3128 https://google.com  #HTTP Proxy