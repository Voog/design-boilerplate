<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" %}
  </head>

  <body class="blog-article-page">
    <div class="site-container">
      {% include "site-header" %}
      {% comment %}{% include "site-sidebar" %}{% endcomment %}

      <main class="page-content" role="main">
        <section class="blog-article content-area">
          {% include "blog-article-template" with "article_page" %}
        </section>

        {% include "blog-article-comments" %}
      </main>

      {% include "site-footer" %}

      {% include "site-javascripts" %}
      <script>site.initArticlePage();</script>
    </div>
  </body>
</html>
