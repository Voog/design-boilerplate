<!DOCTYPE html>
<html lang="et">
<head>
  {% include "html-head" %}
</head>
<body>
  <section class="site-content cfx">
    {% include "site-header" %}

    <main class="page-content cfx" role="main">
      <article class="post">
        <header class="post-header">
          <h1 class="post-title">{% editable article.title %}</h1>
          <time datetime="{{ article.created_at | date : "%Y-%m-%d" }}" class="post-date">{{ article.created_at | date : "%b %d, %Y" }}</time>
          {% include "tags-article" %}
        </header>
        <section class="post-excerpt">
          {% editable article.excerpt %}
        </section>
        <section class="post-body">
          {% editable article.body %}
        </section>
      </article>
    </main>

    {% include "site-footer" %}
  </section>

  {% include "javascripts" %}
  <script>project.initArticlePage();</script>
</body>
</html>