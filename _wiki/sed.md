---
title: Sed
layout: page
collection: wiki
author: Brian Kohles
tags: wiki sed
categories: wiki
---

## replace string
sed -e 's/\/.*\///g'
	- remove /.*/ (directory structure from file)

## join ldif lines together
sed -e :a -e '$!N;s/\n //;ta' -e 'P;D' file
	- Append lines that start with a space to the previous line

## insert a line after a specific line number
sed -i "3i hello" t.txt
	- Insert a line at the 3rd line of the file t.txt that says "hello"
	- -i is to replace the existing file rather than creating new.
sed -i "6i exit 0;" dirinit.sh 
	- insert "exit 0;" after the 6th line of the file

## delete a specific line
sed -e '/uniquemember: cn=null/Id' test.ldif
	- delete lines  that match string
	- I = case insensitive

## convert to lowercase
sed -e 's/\(.*\)/\L\1/'
