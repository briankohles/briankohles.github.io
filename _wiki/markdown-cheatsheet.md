---
layout: page
title: Markdown Cheatsheet
author: Brian Kohles
tags: wiki markdown cheatsheet
categories: markdown
Collection: wiki
---

## Headers

```
# Header 1
thru
###### Header 6

alternate for 1 & 2

Header 1
========

Header 2
--------
```



## Lists
```
* Item 1
    * SubItem 1
    * Subitem 2
```

```
1. Item 1
    2. Subitem 1
```

```
- [x] This is a complete item
- [ ] This is an incomplete item
```

- [x] test
- [ ] test 2

## Links
`[I'm an inline-style link with title](https://www.google.com "Google's Homepage")`

Jekyll Specific
`[Link Text](\{\% post_url 2010-09-08-welcome-to-jekyll \%\})`

## Images
`![alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 1")`

## File Download
`[get the PDF]({{ site.url }}/assets/mydoc.pdf)`

## Code Snippets
```javascript
var s = "JavaScript syntax highlighting";
alert(s);
```
 
```python
s = "Python syntax highlighting"
print s
```

```perl
#!/usr/bin/perl

my $cat='test';
```
