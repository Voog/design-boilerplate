<article class="post">
  <header class="post-header">
    <h2 class="post-title">{% if post-box == "article" %}{% editable article.title %}{% else %}<a href="{{ article.url }}">{{ article.title }}</a>{% endif %}</h2>
    {% assign article_year = article.created_at | format_date: "%Y" | to_num %}

    {% if article_year == current_year %}
      {% assign article_date_format = "long_without_year" %}
    {% else %}
      {% assign article_date_format = "long" %}
    {% endif %}

    <time class="post-date" datetime="{{ article.created_at | date: '%Y-%m-%d' }}">{{ article.created_at | format_date: article_date_format }}</time>
    <div class="post-author">{{ article.author.name }}</div>
  </header>

  <div class="post-content">
    {% unless post-box == "article" %}
      <div class="post-excerpt content-formatted">{{ article.excerpt }}</div>
      <a class="post-read-more-btn" href="{{ article.url }}">{{ "read_more" | lc }}</a>
    {% endunless %}

    {% if post-box == "article" %}
      <div class="post-excerpt content-formatted" {{ edy_intro_edit_text }}>{% editable article.excerpt %}</div>
      <div class="post-body content-formatted">{% editable article.body %}</div>
      {%- assign content_additional_title = "additional_content" | lce -%}
      {%- assign content_additional_title_tooltip = "content_tooltip_additional_information" | lce -%}
      <div class="post-body content-formatted">{% content name="additional_body" bind="Article" title=content_additional_title title_tooltip=content_additional_title_tooltip %}</div>
    {% endif %}
  </div>

  <footer class="post-footer">
    {% unless post-box == "article" %}
      <div class="post-comments-count">
        <a href="{{ article.url }}#comments">{% case article.comments_count %}{% when 0 %}{{ "no_comments" | lc }}{% else %}{{ "comments_for_count" | lc}}: <span class="edy-site-blog-comments-count">{{ article.comments_count }}</span>{% endcase %}</a>
      </div>
    {% endunless %}
  </footer>
</article>
