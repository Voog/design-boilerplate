<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "html-head" %}
  </head>

  <body class="article-page">
    <div class="site-container">
      {% include "site_header" %}

      {% include "site_sidebar" %}

      <main class="page-content" role="main">
        <section class="blog-articles content-formatted">
          {% include "blog_article" with "article_page" %}
        </section>
      </main>

      {% include "site_footer" %}

      {% include "site_javascripts" %}
      <script>site.initArticlePage();</script>
    </div>
  </body>
</html>
