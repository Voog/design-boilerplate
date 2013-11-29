<!-- BASIC META INFO -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="keywords" content="{{ page.keywords }}">
<meta name="description" content="{{ page.description }}">
<meta name="author" content="{{ site.author }}">

<!-- FACEBOOK OPENGRAPH -->
<meta property="fb:admins" content="1227335529"> <!--Site admin's Facebook user id -->
<meta property="og:title" content="{{ site.title }}">
<meta property="og:type" content="website">
<meta property="og:url" content="{{ site.url }}">
<meta property="og:image" content="{{ site.url }}/photos/tbw-esileht-th.jpg">
<meta property="og:site_name" content="{{ site.title }}">
<meta property="og:description" content="{{ description }}">
<!-- http://graph.facebook.com/username - Site admin's username -->
<!-- https://developers.facebook.com/tools/debug - Debug after each modification-->

<!-- FAV ICON -->
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="/favicon.ico" type="image/ico">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="{{ images_path }}/apple-touch-icon.png">

<!-- STYLESHEETS -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,500,700&amp;subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
	<!-- http://www.google.com/fonts -->
<link rel="stylesheet" href="stylesheets/main.css" type="text/css">
	<!--{% stylesheet_link "main.css?1" %}-->
<!--[if lt IE 9]><link rel="stylesheet" href="stylesheets/ie8.css" type="text/css"><![endif]-->
	<!--[if lt IE 9]>{% stylesheet_link "ie8.css?1" %}<![endif]-->

<!-- MODERNIZR - HTML5 SUPPORT FOR OLDER BROWSERS, SVG SUPPORT DETECTION ETC -->
<script type="text/javascript" src="javascripts/modernizr.custom.js"></script>
	<!--<script src="{{ javascripts_path }}/modernizr.custom.js"></script>-->
	<!-- http://modernizr.com/download/ - Check for updates -->

<!-- SITE TITLE -->
<title>Edicy template</title>
	<!-- <title>{% if article %}{{ article.title }} | {{page.site_title}}{% else %}{{page.site_title}} | {{ page.title }}{% endif %}</title>