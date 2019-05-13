---
title: curl
layout: page
collection: wiki
author: Brian Kohles
tags: wiki curl
categories: wiki
---

### use curl to pull back LDAP data
`curl -u 'user:password' 'ldap://host:2389/o=baseDN?uid,cn?sub?(uid=UIDVALUE)'`

## Using Cookies to create/manage a session
### Request the homepage to establish your session & cookies.
`curl -v -b cookiejar.txt -c cookiejar.txt -i -L <URL>`
* Pay attention to the output of this, there may be a hidden form field named “_csrf”, grab the value of this field.
 
### post credentials to login
`curl -v -b cookiejar.txt -c cookiejar.txt -i -L -d "username=<userID>&password=<pasword>&_csrf=<string from above including dashes>" <URL>`
 

After login you are given the homepage & can continue to make requests
