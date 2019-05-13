---
title: awk
layout: page
collection: wiki
author: Brian Kohles
tags: wiki awk
categories: wiki
---

## search lines based on column values
awk -F\: '$2 ~/User/ && $1 ~/B2BProd/ {print $3}' /opt/www/htdocs/server.lists
	print column (seperated by : ) 3 where column 2 contains "User" AND column 1 contains "B2BProd" from file

## search ldif for entries lacking a description
gawk 'BEGIN { IGNORECASE=1; RS="\n\n"; } !/description/ {print ; print "";}' groups_dnOwnerDescription_only.ldif
	- ignore case
	- set Record Seperator to "\n\n" (for parsing an ldif as one record)
	- find records (LDIF entry) that DON'T contain "description"
	- print the found record (LDIF ENTRY) & an extra line (to keep double return seperated.

## Split file into multiple files based on record count.
awk 'NR%1000 == 1{ file = "outputfile" i++ } { print > file }' ORS= RS=------ test.list
	- To output the first 1000 records to outputfile0, the next to outputfile1, etc.

## Count occurences of a line in a file:
awk '{count[$1]++}END{for(j in count) print j,"\t"count[j]}' FS=\t

## Format comma separated to fix width fields
awk -F"," '{printf("%-1s,%-5s,%-6s\n", $1,$2,$3)}' filename.txt

## Split a file into two based on data
awk -F, '{if($2<=500)print > "500L.txt";else print > "500G.txt"}' file1

## split into files named based on column #4
awk -F, '{print >  "somefile_"$4}' <input_file>

## count the number of occurrences of an attribute in an LDIF file & print a status every 100,000 lines
awk ' \
	# set field separator to :
	BEGIN{FS=":"} \
	#if number of records (NR) mod 100000 = 1 (NR is evenly divisible by 100000) then print the number of records processed divided by the number of lines in the file (precomputed) & multiply by 100 to get a percentage complete.
	NR%100000==1{print NR/36654988*100"%"} \
	# add 1 to the count of the occurrences of the first column
	{count[$1]++} \
	#when finished print out the count
	END {for(j in count) print j,"\t" count[j]} \
' entries.ldif 

## find the missing ranges from a list of numbers
awk 'NR-1{if($1!=(_+1))print _}{_=$1}' conns_sorted.list

## find etimes greater than 1000 (1 sec) in an OpenDJ access log
awk 'BEGIN {FS="etime=";} /etime/ && $2>1000 {print;}' access.20160322175201Z

## use awk to find/replace data from one file into another.
FNR -- record number in current file
NR -- total record number (from all files)

awk -F',|, ' 'NR==FNR{a[$1]=$2} NR>FNR{$3=a[$3];print}' OFS=',' "country-list.csv" "Forensic_report_for_04-02-17.csv" 
	- set field seperator (-F) to ',|, '
	- if NR==FNR than assign $2 as the value to hash 'a' with key $1
		- This will occur for the first file passed in only as NR==FNR can only be true for the first file
	- if NR>FNR then set the value of $3 as the vlaue from hash 'a' with key of $3 and print
		- THis will occur for files AFTER the first file as NR will not be greater than FNR until after we switched to the second file & FNR gets reset.
	- Set the Output Field Seperator (OFS) to ","
	- first file passed is the data to be used in the find/replace hash
	- other files will receive the replacement.

## use awk to read a list of CNs & then print out those entries from an LDIF file
