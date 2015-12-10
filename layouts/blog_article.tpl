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
          <section class="blog-article content-area">
            {% include "blog-article-template" with "article_page" %}
          </section>

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
