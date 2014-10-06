{% comment %}<!-- IE SETTINGS -->{% endcomment %}
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->

{% comment %}<!-- BASIC META INFO -->{% endcomment %}
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">

{% comment %}<!-- FAV ICON -->{% endcomment %}
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="/favicon.ico" type="image/ico">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
{% comment %}<!-- TODO: Add functionality after the CMS is going to support it -->{% endcomment %}
{% if site.data.touch_icon %}<link rel="apple-touch-icon" href="{{ site.data.touch_icon }}">{% endif %}

{% comment %}<!-- MODERNIZR - HTML5 SUPPORT FOR OLDER BROWSERS, SVG SUPPORT DETECTION ETC -->{% endcomment %}
<script src="{{ javascripts_path }}/modernizr.js"></script>

{% comment %}<!-- STYLESHEETS -->{% endcomment %}
{% stylesheet_link "main.css" %}
<!--[if lt IE 9]>{% stylesheet_link "ie8.css" %}<![endif]-->
{% if editmode %}<link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.css">{% endif %}
<link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-search/latest/edicy-search.css">

{% comment %}<!-- SITE TITLE -->{% endcomment %}
{% capture page_title %}{% if article %}{{ article.title }} — {{ page.site_title }}{% else %}{% if site.root_item.selected? %}{{ page.site_title }}{% else %}{{ page.title }} — {{ page.site_title }}{% endif %}{% endif %}{% endcapture %}
<title>{{ page_title }}</title>

{% include "open-graph" %}

{% if blog %}{{ blog.rss_link }}{% endif %}
{{ site.stats_header }}
