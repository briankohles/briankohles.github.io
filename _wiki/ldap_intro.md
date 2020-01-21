---
title: ldap intro
layout: page
collection: wiki
author: Brian Kohles
tags: wiki ldap_intro
categories: wiki
---

# LDAP

---

# What is LDAP?

  The Lightweight Directory Access Protocol (LDAP) is an open, vendor-neutral, industry standard application protocol for accessing and maintaining distributed directory information services over an Internet Protocol (IP) network.
  - Wikipedia

---

# What That Means

Lightweight - It's slim, it's fast, data transmission is very minimal.

Directory - It's designed to store simple data as records, like a phone book.

Access - Only defines how data is accessed, it does not define how it is stored. Each LDAP server implementation determines their own method for storing the data.

Protocol - LDAP is an open standards Internet Protocol. It is not a specific product, or vendor implementation.

---

# What is it typically used for?

LDAP originated as a directory, a phone book for storing simple info. It is still used for this but has expanded to become a critical piece of Authentication and Authorization infrastructure for many applications and services.

---

# What Types of Data?

LDAP can store virtually any type of data, including binary data like images.

Most commonly:
  - users
    - Name, e-mail, company Info (department, manager, etc)
    - Password
  - group information
    - group names and descriptions
    - static
      - list of group members
    - dynamic
      - URL defining search criteria to describe group members

---

# What LDAP Isn't

LDAP is not a relational database. You can not combine one record with another record.

What this means is that data for each entry is stored with that entry. Information like Department Name or Manager name is stored individually on each entry, and is duplicated on every entry.

This means that having an effective Identity Provisioning system is critical as a manager with a name change will need to be updated on every record that mentions their name.

---

# LDAP Software

Server - LDAP server implementations come in many shapes & sizes, and from a range of vendors. There are multiple Open Source and closed source versions available from vendors like: IBM, Microsoft, Oracle, Redhat, Apple, Apache, Forgerock, etc.

Client - Since LDAP is an Internet Protocol standard. Client applications an libraries are available for most major platforms and programming languages.

---

# Apache Directory Studio

For today and today only I will be running Apache
Directory Studio for all examples.

https://directory.apache.org/studio/

This software was chosen as it is:

  * Open Source
  * Easy to install and setup
    * Linux, Mac, and Windows available
  * Provides:
    * Basic local server
    * client applications (both GUI and command line)

I do not recommend this software for day to day LDAP administrative work, but it works well as a learning tool.

---

# A Note About LDIF

LDIF - LDAP Data Interchange Format

The data we look at today will be in LDIF format. This is not the way that LDAP sends/receives, or stores data. 

LDIF is a format which translates LDAP data into UTF-8 data. Any data in the LDAP record which is not UTF-8 is base64 encoded.

This makes the data very human readable, and provides a method to export/import directory data between different LDAP implementations, which may not share a common backend database.

An LDIF file can contain multiple entries.

An entry can represent a whole LDAP entry or a change to perform on an entry.

The basic format of an LDIF line is an attribute name, followed by a colon, a space character, and then the value to be assigned to the attribute. This is referred to as an attribute assertion. Attribute names are always case insensitive.


**Example:**
`ATTRIBUTE_NAME: value`

---

# The Parts Of An LDAP Entry

There are only 2 parts to an entry

* The entries Distinguished Name (DN)

* A listing of attribute and value pairs

---

# The Entry DN

First is the Distinguished Name (DN). This is the  unique name identifying the entry in the directory. The LDAP entry elements are not stored in any particular order, but for LDIF format the DN is always the first line in the entry.

It provides the full path to where the entry exists in the directory hierarchy.

A DN is written with the name of the entry on the left, followed by the path describing the hierarchy to the top of the tree on the right. Each element of the hierarchy path is separated by a comma, and an optional space character for readability.

This is the opposite direction of how a file system path is written.

Example DN:
`uid=big_bird,ou=birds,ou=muppets,ou=Sesame Street,o=PBS,c=us`

---

# Building A Complete LDIF Entry

In LDIF format the DN is the first line of the entry.

```
DN: uid=big_bird,ou=birds,ou=muppets,ou=Sesame Street,o=PBS,c=us
```

---

# Attribute Value Pairs

The remaining lines of an LDIF file represent the data for the entry. These lines follow the same attribute name and value format, with a colon & space between them. Continuing with that format we can add additional data to our record.

---

# Building A Complete LDIF Entry

We continue adding additional attribute value pairs (assertions) to our entry. Each of the attributes has a specific purpose, and use. We'll dig into that later. Just as a matter of convention we will list the attribute names in upper case. Remember that attribute names are case insensitive.

```
DN: uid=big_bird,ou=birds,ou=muppets,ou=Sesame Street,o=PBS,c=us
UID: big_bird
CN: Big Bird
GIVENNAME: Big
SN: Bird
STREET: 123 Sesame St
L: Anytown
C: US
USERASSWORD: birdseed
```

---

# What Did We Just Add?

UID - The user ID of the entry
CN - Short for Common Name, typically a joining of Given Name, and SurName
SN - Short for SurName
STREET - The number and street name portion of the address.
L - Locality (City) associated with the other elements of then street address.
C - Two characters, representing the ISO Country Code
USERPASSWORD - The login password to associate with the account, written in plain text.

---
