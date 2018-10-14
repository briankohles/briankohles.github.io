# LDAP

---

# What is LDAP?

  The Lightweight Directory Access Protocol (LDAP) is an open, vendor-neutral, industry standard application protocol for accessing and maintaining distributed directory information services over an Internet Protocol (IP) network.
  - Wikipedia

---

# What That Means

Lightweight - It's slim, it's fast, data transmission is very minimal.

Directory - It's designed to store simple data as records, like a phone book.

Access - Only defines how data is accessed, it does not define how it Is stored. Each LDAP server product determines their own method for storing the data.

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

---

# What LDAP Isn't

LDAP is not a relational database. You can not combine one record with another record.

What this means is that data for each entry is stored with that entry. Information like Department Name or Manager name is stored individually on each entry, and is duplicated on every entry.

This means that having an effective Identity Provisioning system is critical as a manager with a name change will need to be updated on every record that mentions their name.

---

