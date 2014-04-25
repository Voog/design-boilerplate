<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head>
  {% include "html-head" %}
  <link rel="stylesheet" href="/assets/admin/tools/0.1.0/edicy-tools.css">

  <meta property="og:url" content="{{ site.url }}">
  <meta property="og:title" content="{{ site.name }}">
  <meta property="og:description" content="{{ page.description }}">
  <meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fbimage }}"><!-- TODO: Add image location data tag -->
</head>

<body class="post-page js-bgpicker-body-image" {% if site.data.body_image %}style="background-image: url('{{ site.data.body_image}}');"{% endif %}>
  <a class="js-bgpicker-body-settings" data-bg-image="{{ site.data.body_image }}" data-bg-color="{{ site.data.body_color }}"></a>
  <div class="background-color js-bgpicker-body-color"{% if site.data.body_color %} style="background-color: {{ site.data.body_color }};{% if site.data.body_image %} opacity: 0.5;{% endif %}"{% endif %}></div>

  <div class="container">
    {% include "header" %}

    <main class="content" role="main">
      {% include "post-box" with "article" %}

      <section class="comments content-formatted">
        {% case article.comments_count %}{% when 0 %}{% else %}<h2 class="comments-title">{{ "comments_for_count" | lc }}: <span class="edy-site-blog-comments-count">{{ article.comments_count }}</span></h2>{% endcase %}

        {% for comment in article.comments reversed %}
          <div class="comment-block">{{ comment.body }} ({{ comment.author }}, {{ comment.created_at | date : "%b %d, %Y" }})</div>
        {% endfor %}

        {% include "comment-form" %}
      </section>
    </main>

    {% include "footer" %}

  </div>

  {% include "javascripts" %}
  {% include "bg-picker" %}
</body>
</html>
