<!DOCTYPE html>
<html lang="et">
  <head>
    {% include "html-head" %}
    <!-- FACEBOOK OPENGRAPH -->
    <!-- Global opengraph tags are located in "header" component -->
    <meta property="og:url" content="{{ site.url }}/{{ page.path }}">
    <meta property="og:title" content="{{ page.title }} — {{ site.name }}">
    <meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fbimage }}"><!-- TODO: Add image location data tag -->
    <!-- https://developers.facebook.com/tools/debug - Debug after each modification -->
    {{blog.rss_link}}
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
  </body>
</html>