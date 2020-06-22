---
title: ansible
layout: page
collection: wiki
author: Brian Kohles
tags: wiki ansible
categories: wiki
---

## Quickstart
### Install yum
`sudo yum install ansible`

### Mac
`pip install ansible`

## Documentation
`ansible-doc copy`

## Commands
### Run a command against a list of severs
`ansible *.test.example.com -i server.list -m shell -a "hostname" -u USER_TO_RUN_AS -kK`
- server.list is a file containing a list of server FQDNs

### Copy a file to the target
`ansible -m copy -a "src=master.gitconfig dest=~/.gitconfig" localhost`

### Ansible Config File Locations

- Ansible will process the below list and use the first file found, all others are ignored.
  - ANSIBLE_CONFIG (an environment variable)
  - ansible.cfg (in the current directory)
  - .ansible.cfg (in the home directory)
  - /etc/ansible/ansible.cfg


