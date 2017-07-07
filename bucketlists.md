---
layout: page
title: Bucket Lists
---

{% for list in bucketlists %}
  * [ {{ list.title }} ]({{ list.url }})
{% endfor %}
