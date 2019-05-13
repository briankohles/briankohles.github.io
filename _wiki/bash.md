---
title: bash
layout: page
collection: wiki
author: Brian Kohles
tags: wiki bash
categories: wiki
---

## Using Curly Braces

### create a backup of a file
cp file.txt{,.bak}

### move a file in a long directory
mv /a/really/really/long/directory/path/{old_file,new_file}

## print all environment variables
set

## Set command prompt to display current GIT banch
### Add to .bash_profile
```
# set git branch into the prompt
export PS1='[\[$(tput bold)\]\u@\h\[$(tput bold)\] \[$(tput setaf 2)\]`whichBranch` \[$(tput sgr0)\] \w] \n'
```

### create in ~/bin/whichBranch
```
#!/bin/sh
G=`git branch 2>&1 | head -1 | sed -e 's/* //'`
NB=`echo $G | grep "Not a git repository" | wc -l`
if [ $NB -eq 1 ]; then
   echo "nab"
else
   #echo $G
   #if [`${#G}` -gt 15]; then
      echo "*"${G:${#G} - 14}
   #fi
fi
```

## Use the history to run commands
`history` - list the recent commands
`history 5` - list the recent commands, but limit to the last 5
`!235` - (bang 235) execute command #235 from the history list
`!!` - (bang bang) execute the last command again. Handy to run a command again that you forgot to sudo for (sudo !!)

## for loop
```
for VARIABLE in file1 file2 file3
do
	command1 on $VARIABLE
	command2
	commandN
done
```

## infinite loop
`while true; do echo 'Hit CTRL+C'; sleep 1; done`

## recall arguments from previous commands
`!:2` -- Recall second argument
`!:1-3` -- Recall first 3 arguments
Ex:
	`echo a b c d e f`
	`echo !:2-4` - Would run "echo b c d"
