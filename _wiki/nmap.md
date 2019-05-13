---
title: nmap
layout: page
collection: wiki
author: Brian Kohles
tags: wiki nmap
categories: wiki
---

## Using nmap to check SSL/TLS version & Ciphers
`nmap -Pn -sV --script ssl-enum-ciphers -p 636 <FQDN> `
