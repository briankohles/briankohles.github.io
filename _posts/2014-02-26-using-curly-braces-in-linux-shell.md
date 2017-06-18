---
title: Using Curly Braces In Linux Shell
author: Brian Kohles
categories: linux
date: 2014-02-26
layout: post
tags: linux bash cli
---
#### Copying files
```
cp file1.txt{,.bak}
```
expands to:
```
cp file1.txt file1.txt.bak
```

#### Moving Files
```
mv /a/really/long/path/file{.txt,.html}
```
expands to:
```
mv /a/really/long/path/file.txt /a/really/long/path/file.html
```
