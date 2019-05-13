---
title: cut
layout: page
collection: wiki
author: Brian Kohles
tags: wiki cut
categories: wiki
---

## cut characters 20-40 from the line
`cut -c 14-20`

## cut long lines to fit in the terminal
`cut -c -$(($COLUMNS-5)) access_log*`
* $COLUMNS is the current width of the teminal window
