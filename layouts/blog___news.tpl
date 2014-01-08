<!DOCTYPE html>
<html lang="et">
<head>
  {% include "html-head" %}
</head>
<body>
  <section class="site-content cfx">
    {% include "site-header" %}

    <main class="page-content cfx" role="main">
      {% include "tags-blog" %}
      {% for article in articles %}
        <article class="post">
          <header class="post-header">
            <h1 class="post-title"><a href="{{ article.url }}">{{ article.title }}</a></h1>
            <time datetime="{{ article.created_at | date : "%Y-%m-%d" }}" class="post-date">{{ article.created_at | date : "%b %d, %Y" }}</time>
          </header>
          <section class="post-excerpt">
            {{ article.excerpt }}
          </section>
        </article>
      {% endfor %}
    </main>

    {% include "site-footer" %}
  </section>

  {% include "javascripts" %}
  <script>project.initBlogPage();</script>
  <script>
    currentUrl = window.location.href;
    blogUrl = "{{ site.url }}/{{ page.path }}";
    if (currentUrl === blogUrl) {
      $(".posts-all").addClass("active");
    };
  </script>
</body>
</html>