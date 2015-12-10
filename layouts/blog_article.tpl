<!DOCTYPE html>
{% include "template-variables" %}
<html class="{{ view_mode }}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" %}
  </head>

  <body class="blog-news-page blog-article-page {{ language_flags_mode }}">
    <div class="site-container">
      <div class="wrap">
        {% include "site-header" %}
        {% comment %}{% include "site-sidebar" %}{% endcomment %}

        <main class="page-content" role="main">
          <article class="blog-article">
            <header class="article-header">
              <h1 class="article-title">{% editable article.title %}</h1>
              <time class="article-date" datetime="{{ article.created_at | date: "%Y-%m-%d" }}">{{ article.created_at | format_date: "long" }}</time>
              <div class="article-author">{{ article.author.name }}</div>
            </header>

            <div class="article-content">
              <div class="article-excerpt content-area">{% editable article.excerpt %}</div>
              <div class="article-body content-area">{% editable article.body %}</div>
            </div>
          </article>

          {% include "blog-article-comments" %}
        </main>

        {% include "site-footer" %}
      </div>

      {% include "template-tools" %}

      {% include "template-javascripts" %}

      {% comment %}Follow the instructions in "components/site-header.tpl" to enable language menu popover with flags.{% endcomment %}
      {% comment %}{% include "menu-language-popover" %}{% endcomment %}

      <script>site.initArticlePage();</script>
    </div>
  </body>
</html>
