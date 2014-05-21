<article class="post">
  <header class="post-header">
    <h2 class="post-title">{% if post-box == "article" %}{% editable article.title %}{% else %}<a href="{{ article.url }}">{{ article.title }}</a>{% endif %}</h2>
    <time class="post-date" datetime="{{ article.created_at | date : "%Y-%m-%d" }}">{{ article.created_at | date : "%b %d, %Y" }}</time>
    {% if post-box == "article" %}{% include "tags-post" %}{% endif %}
  </header>

  <div class="post-content">
    <div class="post-excerpt content-formatted">{% if post-box == "article" %}{% editable article.excerpt %}{% else %}{{ article.excerpt }}{% endif %}</div>
    {% if post-box == "article" %}<div class="post-body content-formatted">{% editable article.body %}</div>{% endif %}
  </div>

  <footer class="post-footer">
    <div class="post-author">{{ article.author.name }}</div>
  </footer>
</article>
