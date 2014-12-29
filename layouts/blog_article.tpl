<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "bg-picker-variables" with "article" %}
  {% include "html-head" %}
  {% include "bg-picker-styles" %}
</head>

<body class="post-page">
  {% if editmode %}<button class="bgpicker-btn js-body-background-settings" data-bg-image="{{ body_bg_image }}" data-bg-image-sizes="{{ body_bg_image_sizes_str | escape }}" data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button>{% endif %}
  {% if body_bg_image != '' or editmode %}<div class="body-background-image js-body-background-image"></div>{% endif %}
  {% if body_bg_color != '' or editmode %}<div class="body-background-color js-body-background-color"></div>{% endif %}

  <div class="container">
    {% include "header" %}
    {% include "tags-post" %}

    <main class="content" role="main" data-search-indexing-allowed="true">
      {% include "post-box" with "article" %}

      <section id="comments" class="comments content-formatted" data-search-indexing-allowed="false">
        {% if article.comments_count > 0 %}
          <h2 class="comments-title">{{ "comments_for_count" | lc }}: <span class="edy-site-blog-comments-count">{{ article.comments_count }}</span></h2>

          <div class="comment-messages content-formatted">
            {% for comment in article.comments reversed %}
              <div class="comment edy-site-blog-comment">
                <span class="comment-body">{{ comment.body_html }}</span>
                <span class="comment-author">({{ comment.author }},</span>
                <span class="comment-date">{{ comment.created_at | format_date: "long" }})</span>
                <span class="comment-delete">{% removebutton %}</span>
              </div>
            {% endfor %}
          </div>
        {% endif %}

        {% include "comment-form" %}
      </section>
    </main>

    {% include "footer" %}

  </div>

  {% include "javascripts" %}
  {% include "bg-picker" with 'article' %}
  <script>site.initPostPage();</script>
</body>
</html>
