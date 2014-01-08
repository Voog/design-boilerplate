<article class="post">
  <header class="post-header">
    <h1 class="post-title"><a href="{{ article.url }}">{{ article.title }}</a></h1>
    <time datetime="{{ article.created_at | date : "%Y-%m-%d" }}" class="post-date">{{ article.created_at | date : "%b %d, %Y" }}</time>
  </header>
  <section class="post-excerpt">
    {{ article.excerpt }}
  </section>
</article>