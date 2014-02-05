<!-- BASIC META INFO -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="keywords" content="{{ page.keywords }}">
<meta name="description" content="{{ page.description }}">
<meta name="author" content="{{ site.author }}">

<!-- FACEBOOK OPENGRAPH -->
<meta property="fb:admins" content="XXXXXXXXXX"> <!--Site admin's Facebook user id -->
<!-- http://graph.facebook.com/"username" - Replace "username" with site admin's username to get admin's ID) -->
<meta property="og:title" content="{{ site.title }}">
<meta property="og:type" content="website">
<meta property="og:url" content="{{ site.url }}">
<meta property="og:image" content="{{ site.url }}/{{ photos_path }}/tbw-esileht-th.jpg">
<meta property="og:site_name" content="{{ site.title }}">
<meta property="og:description" content="{{ description }}">
<!-- https://developers.facebook.com/tools/debug - Debug after each modification-->

<!-- FAV ICON -->
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="/favicon.ico" type="image/ico">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="{{ images_path }}/apple-touch-icon.png">

<!-- STYLESHEETS -->
{% stylesheet_link "main.css" %}

<!-- MODERNIZR - HTML5 SUPPORT FOR OLDER BROWSERS, SVG SUPPORT DETECTION ETC -->
<script src="{{ javascripts_path }}/modernizr.js?1"></script>
<!-- http://modernizr.com/download/ - Check for updates -->

<!-- SITE TITLE -->
<title>{% if article %}{{ article.title }} | {{ page.site_title }}{% else %}{% if site.root_item %}{{ page.site_title }}{% else %}{{ page.site_title }} | {{ page.title }}{% endif %}{% endif %}</title>