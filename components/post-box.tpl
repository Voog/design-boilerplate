<article class="post">
  <header class="post-header">
    <h2 class="post-title">{% if post-box != "article" %}<a href="{{ article.url }}">{% endif %}{{ article.title }}{% if post-box != "article" %}</a>{% endif %}</h2>
    <time class="post-date" datetime="{{ article.created_at | date : "%Y-%m-%d" }}">{{ article.created_at | date : "%b %d, %Y" }}</time>
    {% if post-box == "article" %}{% include "tags-post" %}{% endif %}
  </header>

  <div class="post-content">
    <div class="post-excerpt content-formatted">{{ article.excerpt }}</div>
    {% if post-box == "article" %}<div class="post-body content-formatted">{{ article.body }}</div>{% endif %}
  </div>

  <footer class="post-footer">
    <div class="post-author">{{ article.author.name }}</div>
  </footer>
</article>
