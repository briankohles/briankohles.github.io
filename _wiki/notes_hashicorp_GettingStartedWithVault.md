---
title: Notes - hashicorp - Getting Started with Hashicorp Vault
layout: page
collection: wiki
author: Brian Kohles
tags: wiki 
categories: wiki
---

https://learn.hashicorp.com/vault

- Working Directory: Documents/Courses/hashicorp-GettingStartedWithVault

## install
`brew install vault`

## Start dev server
`vault server -dev`

## Set environment to connect to dev server
Copy "export VAULT_ADDR*" output from the start dev server command

`export VAULT_ADDR='http://127.0.0.1:8200'`

run this in a new terminal


## Save the unseal key & root token from dev server output
```
Unseal Key: lKlZILjPpCB0BhUJJkgVmvbruFpl0R4udmWwPAKiUGY=
Root Token: s.LVEafEYecTGGAkPDKMaoPgU8
```

Set the root token to environment variable
`export VAULT_DEV_ROOT_TOKEN_ID=s.LVEafEYecTGGAkPDKMaoPgU8`


## Create secret
`vault kv put secret/hello foo=world excited=yes`

## Get secret
`vault kv get secret/hello`

## List secrets
`vault kv list secret/`

## Delete Secret
`vault kv delete secret/hello`

## Enable a Secrets Engine
`vault secrets enable -path=kv kv`

## List Secrets Engines
`vault secrets list`

## disable Secrets Engine
`vault secrets disable kv/`


## Keys
```
Unseal Key 1: TrRFd8iFAm41pC4h+bDuv8T9HNNYlQjCOE8Xb9nqvebb
Unseal Key 2: AB12sI3TevvrwZCAQC3uddqRpz725fmFtWmkpZL36Gb5
Unseal Key 3: rxg//u5mplAvxwX4bBdOTrqH3LPrGIbCpm5Ca+ZsJerz
Unseal Key 4: l7I/gutoa95rzuka+2drKt7Ma/d31Jpv64fdZiOFlGLH
Unseal Key 5: 4ce0QcntgWDSpotWN86K2RXzVMUTXxOU+6RQtJczWrMa

Initial Root Token: s.zd43bRuSZf94QBlifUPHjsUW
```

## Keys for consul
```
Unseal Key 1: bmDWZs0YMs2uFI1mCbL4I6xZ2CGbhqujEYFa7hOJ2dSi
Unseal Key 2: O2apGQuZQLDloC74PVT1JnfXa2PWLJwLAVazX1lYHQRr
Unseal Key 3: nHFFT1SGX2wIykoZNmI4n13gSeOCRs4wQd7kYXR+Guiy
Unseal Key 4: urytX5ngzcCTraO/8jkPU4XmwMhZLkX/TFfW+W15fNqS
Unseal Key 5: j+4tdSMhKWaHxGYQPY3qX/0B0AYD5R2GWbunODQNT7gS

Initial Root Token: s.WKeiVpLVVlRGs9NQ35D2J6pB

```
