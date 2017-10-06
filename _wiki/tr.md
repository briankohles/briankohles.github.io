---
title: tr
layout: page
collection: wiki
author: Brian Kohles
tags: wiki tr
categories: wiki
---

## Remove EOL from a file
tr -d '\r' $file
tr -d '\n' < input.txt > output.txt

## Convert file contents to lower case
tr A-Z a-z < file.txt
