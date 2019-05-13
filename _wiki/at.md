---
title: at
layout: page
collection: wiki
author: Brian Kohles
tags: wiki at
categories: wiki
---

at is useful for scheduling jobs to run at a later time, and not attached to a terminal.

## schedule a script to run at a given time
`at 12:32 -f /usr/local/bin/backup-script`

## list the current jobs
`at -l`
	- will display a job # next to each job

## cancel a job (replace # with the number from above.)
`atrm <#>`
