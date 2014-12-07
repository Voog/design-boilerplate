<article class="blog-article">
  <header class="article-header">
    {% if article-template == "article_page" %}
      <h1 class="article-title">{% editable article.title %}</h1>
    {% else %}
      <h1 class="article-title">
        <a href="{{ article.url }}">{{ article.title }}</a>
      </h1>
    {% endif %}
    <time class="article-date" datetime="{{ article.created_at | date: '%Y-%m-%d' }}">{{ article.created_at | format_date: 'long' }}</time>
    <div class="article-author">{{ article.author.name }}</div>
  </header>

  <div class="article-content">
    <div class="article-excerpt content-formatted">{% if article-template == 'article_page' %}{% editable article.excerpt %}{% else %}{{ article.excerpt }}{% endif %}</div>
    {% if article-template == 'article_page' %}<div class="article-body content-formatted">{% editable article.body %}</div>{% endif %}
  </div>

  {% unless article-template == 'article_page' %}
    <footer class="article-footer">
      <a href="{{ article.url }}#article-comments">{{ 'post_has_replies' | lcc: article.comments_count }}</a>
    </footer>
  {% endunless %}
</article>


