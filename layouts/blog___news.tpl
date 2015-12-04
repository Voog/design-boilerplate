<!DOCTYPE html>
{% include "template-variables" %}
<html class="{{ view_mode }}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" %}
  </head>

  <body class="blog-page blog-and-news-page {{ language_flags_mode }}">
    <div class="site-container">
      <div class="wrap">
        {% include "site-header" %}
        {% comment %}{% include "site-sidebar" %}{% endcomment %}

        <main class="page-content" role="main">
          <section class="blog-articles content-area">
            {% addbutton %}
            {% for article in articles %}
              {% include "blog-article-template" %}
            {% endfor %}
          </section>
        </main>

        {% include "site-footer" %}
      </div>

      {% include "template-tools" %}

      {% include "template-javascripts" %}

      {% comment %}Follow the instructions in "components/site-header.tpl" to enable language menu popover with flags.{% endcomment %}
      {% comment %}{% include "menu-language-popover" %}{% endcomment %}

      <script>site.initBlogPage();</script>
    </div>
  </body>
</html>
