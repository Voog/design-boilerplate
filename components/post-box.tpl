<article class="post">
  <header class="post-header">
    <h2 class="post-title"><a href="{{ article.url }}">{{ article.title }}</a></h2>
    <time class="post-date" datetime="{{ article.created_at | date : "%Y-%m-%d" }}">{{ article.created_at | date : "%b %d, %Y" }}</time>
  </header>

  <div class="post-content">
    <div class="post-excerpt content-formatted">{{ article.excerpt }}</div>
  </div>

  <footer class="post-footer">
    <div class="post-author">{{ article.author.name }}</div>
  </footer>
</article>
