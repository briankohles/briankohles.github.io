---
title: GPG
layout: page
collection: wiki
author: Brian Kohles
tags: wiki gpg
categories: wiki
---

## Generate a new key
```
gpg --gen-key generate a new key
	- Will prompt for answers to questions
	- Can the answers be fed as part of the command? Otherwise create a perl sub to do this.
	- Each key in the keychain will have it's own password

gpg --passphrase password --decrypt-file testfile.txt.gpg -o testfile2.txt
	Use a password to decrypt the file

gpg --list-keys


-e, --encrypt [file]
-d, --decrypt [file]
--list-keys [names]
--list-public-keys [names]
-K, --list-secret-keys [names]
--delete-key name
--delete-secret-key name
--delete-secret-and-public-key name
--export [names]
--export-secret-keys [names]
--export-secret-subkeys [names]
--import [files]
-r, --recipient name
-a, --armor
-o, --output file
-q, --quiet
--batch
--homedir directory
--debug flags
--passphrase-fd n
	If you use  0  for  n, the passphrase will be read from stdin.
--passphrase string
```


# GPG2 started requiring the agent to run
# presumably you already have a .gnupg directory, but this won't hurt even if you do
`mkdir -p -m 700 ~/.gnupg`
# now let's create the socket.  The "p" below says make it a "pipe" (aka: fifo or socket)
`mknod -m 700 ~/.gnupg/S.gpg-agent p`
# And give gpg-agent a whirl:
`gpg-agent --daemon`

From <http://www.linuxquestions.org/questions/linux-security-4/gpg-gpg-agent-can%27t-connect-to-root-gnupg-s-gpg-agent-611843/> 

To prevent gpg from asking for the passphrase we echo the passphrase into the command. However we still had to add in the option "--batch" to get the "--passphrase-fd 0" option to work with the pipe
echo "passphrase" | gpg --batch --passphrase-fd 0 --homedir /home/jobs/.gnupg --no-tty --output file.txt --skip-verify --decrypt encryptedfile.pgp

From <https://www.centos.org/forums/viewtopic.php?t=44661> 
