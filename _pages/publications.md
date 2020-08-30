---
layout: page
permalink: /publications/
title: Publications
description:
years: [2020, 2017, 2015]
---

{% for y in page.years %} 
  <h3 class="year">{{y}}</h3>
  {% bibliography -f papers -q @*[year={{y}}]* %}
{% endfor %}

