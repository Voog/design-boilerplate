<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
  {% include "bg-picker-variables" %}
  {{ blog.rss_link }}
  {{ site.stats_header }}
</head>

<body class="blog-page">
  {% if editmode %}<button class="bgpicker-btn js-bgpicker-body-settings" data-bg-image="{{ body_image }}" data-bg-color="{{ body_color }}"></button>{% endif %}
  {% unless editmode %}
    {% if body_color != '' or editmode %}<div class="background-color js-bgpicker-body-color"{{ body_color_style }}></div>{% endif %}
  {% else %}
    <div class="background-color js-bgpicker-body-color"{{ body_color_style }}></div>
  {% endunless %}

  <div class="container">
    {% include "header" %}
    {% include "tags-blog" %}

    <main class="content" role="main">
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
      blogUrl = "{{ site.url }}{{ page.path }}";
      if (currentUrl === blogUrl) {
        $(".js-tags-all").addClass("active");
      };
    });

    {% unless body_image == nil or body_image == '' %}
      $.backstretch('{{ body_image }}');
    {% endunless %}

    site.initBlogPage();
  </script>
</body>
</html>
