<article class="post">
  <header class="post-header">
    <h2 class="post-title">{% if post-box == "article" %}{% editable article.title %}{% else %}<a href="{{ article.url }}">{{ article.title }}</a>{% endif %}</h2>
    <time class="post-date" datetime="{{ article.created_at | date : "%Y-%m-%d" }}">{{ article.created_at | format_date : "long" }}</time>
    <div class="post-author">{{ article.author.name }}</div>
    {% if post-box == "article" %}{% include "tags-post" %}{% endif %}
  </header>

  <div class="post-content">
    <div class="post-excerpt content-formatted">{% if post-box == "article" %}{% editable article.excerpt %}{% else %}{{ article.excerpt }}{% endif %}</div>
    {% if post-box == "article" %}<div class="post-body content-formatted">{% editable article.body %}</div>{% endif %}
  </div>

  <footer class="post-footer">
    {% unless post-box == "article" %}
      <div class="post-comments-count">
        <a href="{{ article.url }}#comments">{% case article.comments_count %}{% when 0 %}{{ "no_comments" | lc }}{% else %}{{ "comments_for_count" | lc}}: <span class="edy-site-blog-comments-count">{{ article.comments_count }}</span>{% endcase %}</a>
      </div>
    {% endunless %}
  </footer>
</article>
