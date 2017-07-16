---
title: Setting Up Jekyll For Blogging
date: 2017-07-14
author: Brian Kohles
tags: blog Jekyll 
layout: page
---

## Jekyll Docs
https://jekyllrb.com/docs/home/

## Using Poole

## Things added
https://eduardoboucas.com/blog/2014/12/07/including-and-managing-images-in-jekyll.html
Comments from discus

# Adding the ability to have linked posts
https://github.com/herrvoigt/jekyll-linkposts

# links posts
http://www.cagrimmett.com/til/2016/06/10/external-post-links-jekyll.html

## creating drafts folder

## setting up structure for post images

## using HTML comments in MD files

## Tools for blogging
* Erato Mac OS X Markdown App
* Github.com
* Git Command line    

## my post creation script







Jekyll Internal Links
{% highlight text %}{% raw %}
[Some Link]({% post_url 2010-07-21-name-of-post %})
{% endraw %}{% endhighlight %}

## Reponsive Video Embeds
This post gives details about how to setup responsive video embeds.
[Eduardo Boucas - Responsive Video Embeds](https://eduardoboucas.com/blog/2016/12/21/responsive-video-embeds-jekyll.html)

{% highlight text %}{% raw %}
{ % include helpers/video.html url="https://www.youtube.com/embed/fy7q0klb0yI" width="560" height="315" % }
{% endraw %}{% endhighlight %}
