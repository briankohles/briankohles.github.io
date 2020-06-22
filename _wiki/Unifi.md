---
title: Unifi Network Equipment & Controller
layout: page
collection: wiki
author: Brian Kohles
tags: wiki 
categories: wiki
---

## When installing the Unifi Controller on Mac

- It seems to like to install with incorrect permissions. After install run:
``` shell
sudo chown -R briankohles:staff /Applications/UniFi*
```
- Without this chage there is an error about database permissions
