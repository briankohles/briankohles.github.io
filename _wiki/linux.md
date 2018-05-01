---
title: linux
layout: page
collection: wiki
author: Brian Kohles
tags: wiki Linux
categories: wiki
---

## SE Linux

Get the context of a process

`ps auxZ | grep -i httpd `

Get the context of a file

`ls -laZ emmet.png terminator.png`

Restore the context of a directory

`restorecon -Rv /srv/www`

## systemctl

How to list all enabled services from systemctl

`systemctl list-unit-files | grep enabled` - will list all enabled services