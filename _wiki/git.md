---
title: Git
layout: page
collection: wiki
author: Brian Kohles
tags: wiki git
categories: wiki
---

# set git to remember password in memory
git config --global credential.helper cache

# Git Reference (quick refrence with links to specific doc & book sections for more details.)
http://gitref.org/

# Initialize a git repo. This can be used to do minor management without a server
```
cd /project/directory/
git init
git add somefile.ext
git commit -m 'Initial commit.'
```

## Restore a deleted file
*CD to the directory that contained the file
* run git log to see list of all commits
	- git log --stat

	commit 1f51a84aa9b7e...f2438e0a2340d40c
	Author: Brian Kohles <brian.kohles@email.com>
	Date:   Wed Jan 20 16:35:08 2016 +0000
	
	    deleting old data conversion scripts
	
	 .../files/opt/opendj/dataConversion/b2e/convertTdsToOpenDjB2E.sh                  | 19 -------------------
	 .../files/opt/opendj/dataConversion/b2e/removeDupeMembers.pl                      | 38 --------------------------------------
	 2 files changed, 57 deletions(-)

* find the commit that caused the delete
	543445a8d06...7d7b7e8a8446 (Wed Jan 20 20:45:02 2016 +0000)
	1f51a84aa9b7e...80a2340d40c (Wed Jan 20 16:35:08 2016 +0000) -- deleted in this commit
	54aaadd6d09...d8b6992191d0c (Wed Jan 20 15:26:31 2016 +0000) -- checkout from the previous commit

 view the changes for that commit

## Compare a branch to origin/prod listing only the changed files
### if already in the branch
git diff --name-status origin/prod
git diff --name-only origin/prod...
### checking a branch that you don't have checked out
 git diff --name-status origin/prod...origin/dev_new
### compare staged changes against HEAD?
git diff --staged

### show the number of changes per file
git diff --stat origin/prod origin/dev_new

## Comparing an individual file against prod
git diff origin/prod infra_modules/ldap_opendj_b2e_server_v1_0_0/data/categories/appl/common.yaml

## branch - list branches
git branch
	- list the checked out branches, current branch is green with a *
git branch -a
	- list all branches local and remote
git branch -r
	- list all remote branches

## Remove a file from a commit after adding it
git reset <file>

## switch to a different branch
git checkout <branch>

## merge changes from origin/prod into the current branch
git merge origin/prod

## create a new copy of the puppet repo
git clone git@host:puppet-sbx/puppet-environments.git

## Keep the code up to date with everything else happening
```
# grab the current updates for this branch
git fetch
# merge updates from origin
git merge origin/prod
# push all the changes back into our branch-
git push
```
## General GIT flow
	### Initial setup
		a. Create a new copy of the repo
			§ git clone git@host:puppet-sbx/puppet-environments.git
			§ Checkout the branch you want to work with
				□ git checkout <branch>
		b. Get the current version of the branch
			§ git fetch
	### Ongoing work
		a. Make changes to the files as needed
		b. Add changes to commit
			§ git add [list of files/paths]
		c. Commit added changes (only commits locally)
			§ git commit -m "[commit comment]"
		d. Push commits to remote
			§ git push
	### On a regular basis (daily/weekly) - Pull in changes that have occurred outside of current branch
		a. get updates from branch
			§ git fetch --prune
				□ --prune to remove files.
		b. merge updates from origin (merge will also do a commit of the updates)
			§ git rebase origin/prod
		c. push these updates back up to our branch
			§ git push

# checkout file to how it was at the previous commit (does this actually go back to the last commit, or the state of HEAD?)
git checkout -- <file(s)>
	
# Setup git pull to use rebase by default. Should already be in /etc/gitconfig
git config --global branch.autosetuprebase always

# Setup git push to use simple push by default. Should already be in /etc/gitconfig
git config --global push.default simple

# Speed up git by enabling preloadindex. Should already be in /etc/gitconfig
git config --global core.preloadindex true

# graph out the log data into branches
git log --graph --decorate --pretty=oneline --abbrev-commit prod origin/prod temp

## Figure out how to undo something in GIT
https://sethrobertson.github.io/GitFixUm/fixup.html

## Show files ready to push
git diff --numstat [remote repo/branch]

## Determine what branches are merged to master
`git branch --merged master` -- lists branches merged into master
`git branch --merged` -- lists branches merged into HEAD (i.e. tip of current branch)
`git branch --no-merged` -- lists branches that have not been merged 

## Show the difference between a commit and its ancestor
`git diff COMMIT_HASH^ COMMIT_HASH`
	The ^ gets the first parent of the commit then compares that to the actual commit
	• On linux this can be shorted to "git diff COMMIT{^,}
		○ the "{^,}" will expand & create two arguments passed to git diff one with the carat & the second without

## pick specific commits to pull from one branch into another. Useful for creating hot fixes to push out before a full branch is ready.
git cherry-pick COMMIT_HASH
	• add "--stdin" to paste in a list of hashes


## using vimdiff to solve git merge conflicts
http://www.rosipov.com/blog/use-vimdiff-as-git-mergetool/

## Creating a diff from one branch to move changes to a new branch
	- While in the branch with the changes:
		○ git diff origin/prod > changes.diff
	- review the diff files & delete any sections (the whole section) for changes you don't want to apply.
	- checkout the branch you want to move the changes to:
	- move the changes.diff file to the root of your git directory
	- apply the changes
		○ git apply -p1 changes.diff
	- if this fails with "patch does not apply" try:
		○ git apply --reject --whitespace=fix mychanges.patch
			§ This will apply each patch individually & create a rejects file (in the same location as the file to be patched) for any patches that fail. This narrows down the manual changes to just a couple.

## Find what files have changed since your branch diverged from origin
git diff --name-only origin...

## Using Stash
git stash
	- stash the current changes
git stash list
	- list out the current stashes
	- stash@{#} -- this is the stash number
git stash show -p <stash@{#}>
	- Show the diff of the last or given stash
git stash apply <stash@{#}>
	- Apply the last or given stash
git stash drop <stash@{#}>
	- remove the named stash from the stack
git stash pop
	- does an apply & a drop of the stash
