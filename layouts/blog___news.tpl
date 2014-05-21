<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head>
  {% include "html-head" %}

  <meta property="og:url" content="{{ site.url }}">
  <meta property="og:title" content="{{ site.name }}">
  <meta property="og:description" content="{{ page.description }}">
  <meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fb_image }}"><!-- TODO: Add image location data tag -->

  {{ blog.rss_link }}
</head>

<body class="blog-page js-bgpicker-body-image" {% if site.data.body_image %}style="background-image: url('{{ site.data.body_image}}');{% if site.data.body_color %} position: relative;{% endif %}"{% endif %}>
  {% if editmode %}<button class="bgpicker-btn js-bgpicker-body-settings" data-bg-image="{{ site.data.body_image }}" data-bg-color="{{ site.data.body_color }}"></button>{% endif %}
  <div class="background-color js-bgpicker-body-color"{% if site.data.body_color %} style="background-color: {{ site.data.body_color }};{% if site.data.body_image %} opacity: 0.5;{% endif %}{% endif %}"></div>

  <div class="container">
    {% include "header" %}

    <main class="content" role="main">
      {% include "tags-blog" %}

      {% addbutton %}
      {% for article in articles %}
        {% include "post-box" %}
      {% endfor %}
    </main>

    {% include "footer" %}

  </div>

  {% include "javascripts" %}
  {% include "bg-picker" %}

  <script>
    $(document).ready(function() {
      currentUrl = window.location.href;
      blogUrl = '{{ site.url }}{{ page.path }}';
      if (currentUrl === blogUrl) {
        $('.js-tags-all').addClass('active');
      };
    });

    site.initBlogPage();
  </script>
</body>
</html>
