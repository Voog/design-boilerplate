{% comment %}FACEBOOK OPEN GRAPH META TAGS{% endcomment%}
{% comment %}https://developers.facebook.com/tools/debug - Debug after each modification{% endcomment %}
{% if site.data.fb_admin %}<meta property="fb:admins" content="{{ site.data.fb_admin }}">{% endif %}
<meta property="og:type" content="{% if article %}article{% else %}website{% endif %}">
<meta property="og:url" content="{{ site.url }}{% if article %}{{ article.url | remove_first:'/' }}{% else %}{{ page.url | remove_first:'/' }}{% endif %}">
<meta property="og:title" content="{{ page_title | escape }}">
<meta property="og:site_name" content="{{ page.site_title | escape }}">

{% comment %}Open Graph image{% endcomment %}
{% if article and article.data.fb_image %}
  <meta property="og:image" content="{{ article.data.fb_image }}">
{% elsif page.data.fb_image %}
  <meta property="og:image" content="{{ page.data.fb_image }}">
{% elsif site.data.fb_image %}
  <meta property="og:image" content="{{ site.data.fb_image }}">
{% endif %}

{% comment %}Open Graph description{% endcomment %}
{% if blog_page and (page.description == nil or page.description == "") %}
  {% assign description = articles.first.excerpt | strip_html | escape | strip_newlines | truncatewords: 200, '...' %}
  <meta property="og:description" content="{{ description }}">
  <meta name="description" content="{{ description }}">
{% else %}
  {% if article %}{% assign description = article.description %}{% else %}{% assign description = page.description %}{% endif %}
  {% if description != nil and description != "" %}
    <meta property="og:description" content="{{ description }}">
    <meta name="description" content="{{ description }}">
  {% endif %}
{% endif %}
