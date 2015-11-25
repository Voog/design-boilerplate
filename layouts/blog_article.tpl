<!DOCTYPE html>
{% include "template-variables" %}
<html class="blog-page blog-article-page {{ view_mode }} {{ language_flags_mode }}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" %}
  </head>

  <body>
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
