<!-- IE SETTINGS -->
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->

<!-- BASIC META INFO -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="keywords" content="{{ page.keywords }}">
<meta name="description" content="{{ page.description }}">

<!-- FAV ICON -->
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="/favicon.ico" type="image/ico">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="{{ images_path }}/{{ page.data.touchicon }}"> <!-- TODO: Add image location data tag -->

<!-- MODERNIZR - HTML5 SUPPORT FOR OLDER BROWSERS, SVG SUPPORT DETECTION ETC -->
<script src="{{ javascripts_path }}/modernizr.js?21"></script>

<!-- STYLESHEETS -->
{% stylesheet_link "main.css?21" %}
<!--[if lt IE 9]>{% stylesheet_link "ie8.css?21" %}<![endif]-->
<!--[if lt IE 10]>{% stylesheet_link "ie9.css?21" %}<![endif]-->
<link rel="stylesheet" href="/assets/admin/tools/0.1.1/edicy-tools.css">

<!-- SITE TITLE -->
<title>{% if article %}{{ article.title }} — {{ page.site_title }}{% else %}{% if site.root_item.selected? %}{{ page.site_title }}{% else %}{{ page.title }} — {{ page.site_title }}{% endif %}{% endif %}</title>

<!-- FACEBOOK OPENGRAPH -->
<!-- Page specific opengraph tags are located in each page template -->
{% if site.data.fb_admin %}<meta property="fb:admins" content="{{ site.data.fb_admin }}">;{% comment %}<!-- TODO: Add functionality -->{% endcomment %}{% endif %}
<!-- http://graph.facebook.com/"username" - Replace "username" with site admin's username to get admin's ID) -->
<meta property="og:type" content="website">
<!-- https://developers.facebook.com/tools/debug - Debug after each modification -->
