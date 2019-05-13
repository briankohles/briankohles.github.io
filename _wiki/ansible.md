---
title: ansible
layout: page
collection: wiki
author: Brian Kohles
tags: wiki ansible
categories: wiki
---

## Quickstart
### Install
`sudo yum install ansible`

### Run a command against a list of severs
`ansible *.test.example.com -i server.list -m shell -a "hostname" -u USER_TO_RUN_AS -kK`
  - server.list is a file containing a list of server FQDNs
