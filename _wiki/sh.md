---
title: sh
layout: page
collection: wiki
author: Brian Kohles
tags: wiki sh
categories: wiki
---

## if regex
if [[ $SERVER =~ ".test." ]]; then
        PASS=test;
else
        PASS=prod;
fi
