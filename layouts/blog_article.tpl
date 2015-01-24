<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include 'html-head' %}
  </head>

  <body class="article-page">
    <div class="site-container">
      {% include 'site-header' %}

      {% include 'site-sidebar' %}

      <main class="page-content" role="main">
        <section class="blog-news-articles content-area">
          {% include 'article-template' with 'article_page' %}
        </section>

        {% include 'article-comments' %}
      </main>

      {% include 'site-footer' %}

      {% include 'site-javascripts' %}
      <script>site.initArticlePage();</script>
    </div>
  </body>
</html>
