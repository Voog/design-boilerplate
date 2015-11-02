<!DOCTYPE html>
{% include "template-variables" %}
<html class="blog-page blog-and-news-page {{ view_mode }}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" %}
  </head>

  <body>
    <div class="site-container">
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
      <script>site.initBlogPage();</script>
    </div>
  </body>
</html>
