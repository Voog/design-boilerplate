<!DOCTYPE html>
{% include "template-variables" %}
<html class="{{ view_mode }}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" %}
  </head>

  <body class="blog-page blog-article-page {{ language_flags_mode }}">
    <div class="site-container">
      <div class="wrap">
        {% include "site-header" %}
        {% comment %}{% include "site-sidebar" %}{% endcomment %}

        <main class="page-content" role="main">
          <section class="blog-article content-area">
            {% include "blog-article-template" with "article_page" %}
          </section>

          {% include "blog-article-comments" %}
        </main>

        {% include "site-footer" %}
      </div>

      {% include "menu-language-popover" %}

      <script>site.initArticlePage();</script>
    </div>
  </body>
</html>
