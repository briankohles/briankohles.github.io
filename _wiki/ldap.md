---
title: ldap
layout: page
collection: wiki
author: Brian Kohles
tags: wiki ldap
categories: wiki
---

# LDAP URL format
`ldap://HOST:PORT/BASEDN?COMMA-SEP-ATTRS?SCOPE?FILTER?COMMA-SEP-EXTENSIONS`

# Query OpenDJ for the name of the current server
- Useful to determine which servers are behind a VIP (will not work thorugh VDS)
`ldapsearch -h ldap.test.domain.com -p 2389 -D "cn=directory manager" -j /opt/opendj/.dirpwd -b "cn=System Information,cn=monitor" -s base "(objectclass=*)" "systemName"`

# Oracle page about ObjectClasses & Attributes
https://docs.oracle.com/cd/E19099-01/nscp.dirsvr416/816-6682-10/ocindex.htm
