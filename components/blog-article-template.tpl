<article class="blog-article">
  <header class="article-header">
    <h1 class="article-title">{% if blog-article-template == "article_page" %}{% editable article.title %}{% else %}<a href="{{ article.url }}">{{ article.title }}</a>{% endif %}</h1>
    <time class="article-date" datetime="{{ article.created_at | date: "%Y-%m-%d" }}">{{ article.created_at | format_date: "long" }}</time>
    <div class="article-author">{{ article.author.name }}</div>
  </header>

  <div class="article-content">
    <div class="article-excerpt content-area">{% if article-template == "article_page" %}{% editable article.excerpt %}{% else %}{{ article.excerpt }}{% endif %}</div>
    {% if article-template == "article_page" %}<div class="article-body content-area">{% editable article.body %}</div>{% endif %}
  </div>

  {% unless article-template == "article_page" %}
    <footer class="article-footer">
      <a href="{{ article.url }}#article-comments">{{ "post_has_replies" | lcc: article.comments_count }}</a>
    </footer>
  {% endunless %}
</article>


