---
layout: post
title: Unix Commands I Love
date: 2015-06-01
author: Brian Kohles
tags: unix commandline linux
categories: unix
---

I've been spending more time lately increasing my knowledge of unix commands in order to make my daily log parsings, etc easier. I've found that I have a lot of commands that I use out of habit and they get things done, but not necessarily in the best way. So I thought I'd write about a few of my favorite new commands.

### watch
The `watch` command is great for monitoring something for a change, or just to keep an open status.

You can do something simple just to keep a terminal session active
```
watch -n 60 date
```
or something more complex like generating a small report from log output
```
watch -n 30 'echo "SUCCESS"; grep -ic "success" results.log; echo "SKIPPED"; grep -icv "success" results.log; echo "TOTAL"; wc -l results.log;
```

this will generate a nice little report like:
```
SUCCESS
13886
SKIPPED
114
TOTAL
14000 results.log
```

the `-n [sec]` argument defines how frequently to update the data. At that interval the screen will refresh and the updated info displayed.

### awk
I have several awk one liners that I use almost daily

* Yank a specific record from an LDIF
```
gawk 'BEGIN {IGNORECASE=1; RS="\n\n"} /cn: Brian Kohles/ {print ; print "";} example.ldif
```
* Count occurences column 1 ($1) in a file
```
awk '{count[$1]++} END {for(j in count) print j,"\t" count[j]}'
```
* Split a file into multiple 1000 line files
```
awk 'NR%1000 == 1 {file = "outputfile" i++} {print > file}' file.txt
```
