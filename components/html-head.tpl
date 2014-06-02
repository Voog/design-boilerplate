{% comment %}<!-- IE SETTINGS -->{% endcomment %}
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->

{% comment %}<!-- BASIC META INFO -->{% endcomment %}
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="keywords" content="{{ page.keywords }}">
<meta name="description" content="{{ page.description }}">

{% comment %}<!-- FAV ICON -->{% endcomment %}
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="/favicon.ico" type="image/ico">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="{{ images_path }}/{{ page.data.touchicon }}"> <!-- TODO: Add image location data tag -->

{% comment %}<!-- MODERNIZR - HTML5 SUPPORT FOR OLDER BROWSERS, SVG SUPPORT DETECTION ETC -->{% endcomment %}
<script src="{{ javascripts_path }}/modernizr.js?21"></script>

{% comment %}<!-- STYLESHEETS -->{% endcomment %}
{% stylesheet_link "main.css?21" %}
<!--[if lt IE 9]>{% stylesheet_link "ie8.css?21" %}<![endif]-->
<link rel="stylesheet" href="/assets/admin/tools/0.1.1/edicy-tools.css">

{% comment %}<!-- SITE TITLE -->{% endcomment %}
<title>{% if article %}{{ article.title }} — {{ page.site_title }}{% else %}{% if site.root_item.selected? %}{{ page.site_title }}{% else %}{{ page.title }} — {{ page.site_title }}{% endif %}{% endif %}</title>

{% comment %}<!-- FACEBOOK OPENGRAPH -->{% endcomment %}
{% comment %}<!-- Page specific opengraph tags are located in each page template -->{% endcomment %}
{% comment %}<!-- TODO: Add functionality after the CMS is going to support it -->{% endcomment %}
{% if site.data.fb_admin %}<meta property="fb:admins" content="{{ site.data.fb_admin }}">{% endif %}
<meta property="og:type" content="website">
{% comment %}<!-- https://developers.facebook.com/tools/debug - Debug after each modification -->{% endcomment %}
