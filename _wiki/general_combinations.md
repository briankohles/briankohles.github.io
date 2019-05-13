---
title: general and combinations
layout: page
collection: wiki
author: Brian Kohles
tags: wiki general combinations
categories: wiki
---

## Determine ACSII code for a character
`printf "%d\n" "'-" #(standard dash)`
`printf "%d\n" "'–" #(em dash)`

## return random 3000 lines from a text file
```
awk 'BEGIN {srand()} {print rand() " " $0}' file8000.txt
    | sort
    | tail -3000
    | sed 's/[^ ]* //'
    >file3000.txt
```
	**Note:** Pasted from <http://stackoverflow.com/questions/7514896/select-random-3000-lines-from-a-file-with-awk-codes> 
