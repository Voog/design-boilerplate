<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign blog_article_page = true %}
  {% include "bg-picker-variables" with "article" %}
  {% include "html-head" %}
  {% include "bg-picker-styles" %}
</head>

<body class="post-page js-bg-picker-area">
  {% if editmode %}
    <button class="voog-bg-picker-btn js-background-settings" data-bg-key="body_bg" data-bg-picture-boolean="true" data-bg-image="{{ body_bg_image }}" data-bg-image-sizes="{{ body_bg_image_sizes_str | escape }}" data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button>
  {% endif %}

  <div class="background-image js-background-image"></div>
  <div class="background-color js-background-color"></div>

  <div class="container js-bg-picker-area">
    <div class="js-background-type {{ container_bg_type }}">
      <div class="background-color js-background-color">
        {% if editmode %}
          <button class="voog-bg-picker-btn js-background-settings" data-bg-key="container_bg" data-bg-picture-boolean="false" data-bg-color="{{ container_bg_color }}" data-bg-color-data="{{ container_bg_color_data_str | escape }}"></button>
        {% endif %}

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
    </div>
  </div>

  {% include "javascripts" %}
  {% include "bg-picker" with 'article' %}
  <script>site.initPostPage();</script>
</body>
</html>
