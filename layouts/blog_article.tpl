<!DOCTYPE html>
<html lang="{{ page.language_code }}">
  <head>
    {% include "html-head" %}
    <!-- FACEBOOK OPENGRAPH -->
    <!-- Global opengraph tags are located in "header" component -->
    <meta property="og:url" content="{{ site.url }}/{{ article.url }}">
    <meta property="og:title" content="{{ article.title }} — {{ page.site_title }}">
    <meta property="og:description" content="{{ article.excerpt | strip_html | truncate : 200 }}">
    <meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fbimage }}"><!-- TODO: Add image location data tag -->
    <!-- https://developers.facebook.com/tools/debug - Debug after each modification -->
  </head>

  <body class="post-page">
    <div class="container cfx">
      {% include "site-header" %}

      <main class="content user-content" role="main">
        <article class="post">
          <header class="post-header">
            <h1 class="post-title">{% editable article.title %}</h1>
            <time datetime="{{ article.created_at | date : "%Y-%m-%d" }}" class="post-date">{{ article.created_at | date : "%b %d, %Y" }}</time>
            {% include "tags-article" %}
          </header>
          <section class="post-content">
            <div class="post-excerpt content-formatted cfx">{% editable article.excerpt %}</div>
            <div class="post-body content-formatted cfx">{% editable article.body %}</div>
          </section>
        </article>

        <section class="comments">
          <h2 class="comments-title">
            {% case article.comments_count %}{% when 0 %}{{ "no_comments" | lc }}{% else %}{{ "comments_for_count" | lc }}: <span class="comments-count">{{ article.comments_count }}</span>{% endcase %}</h2>

          {% for comment in article.comments %}
            <div class="comment">{{ comment.body }} {{ comment.author }}, ({{ comment.created_at | date : "%b %d, %Y" }})</div>
          {% endfor %}

          {% include "post-comment-form" %}
        </section>
      </main>

      {% include "site-footer" %}
    </div>

    {% include "javascripts" %}
    <script>project.initArticlePage();</script>
  </body>
</html>
