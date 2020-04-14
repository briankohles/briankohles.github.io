---
title: splunk
layout: page
collection: wiki
author: Brian Kohles
tags: wiki splunk
categories: wiki
---

## Assign an extra field value
`eval hostType="old"`

## Replace part of a string
`eval src=replace(CLIENT, ":.*", "") `

## Compare fields
`where src != dest`
