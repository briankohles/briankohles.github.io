---
title: Notes - Pluralsight - Getting Started with Ansible
layout: page
collection: wiki
author: Brian Kohles
tags: wiki 
categories: wiki
---

- Working Directory: Documents/Courses/Pluralsight-GettingStartedWithAnsible
- Sample Code: https://github.com/g0t4/course-ansible-getting-started

- [ ] Install homebrew
- [ ] Install bat
- [ ] Install tree
  - tree -C alias

## Ad-hoc
### Commands run:
`ansible -m copy -a "src=master.gitconfig dest=~/.gitconfig" localhost`

`ansible -m copy -a "src=master.gitconfig dest=~/.gitconfig" --check --diff localhost`

`ansible -m shell -a "hostname" -vvvv  localhost`



## Managing Mac with Ansible
- install homebrew
- download linux setup from gitlab
`ansible -m copy -a "src=master.gitconfig dest=~/.gitconfig" --check --diff localhost`
- Manage these types of file with git repo

`ansible -m homebrew -a "name=bat state=latest" localhost`
- install bat command from homebrew

`ansible -m homebrew -a "name=jq state=latest" localhost`

## Playbooks
[Intro to Playbooks](https://docs.ansible.com/ansible/latest/user_guide/playbooks_intro.html)

`ansible-playbook playbook.yaml`


## spin up a quick docker container
`docker run --rm -it python bash`

## connect to multiple machines using ansible
`ansible-console containers`
- containers is defined in the inventory file as 3 docker containers
