<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include 'html-head' %}
  </head>

  <body class="blog-page">
    <div class="site-container">
      {% include 'site-header' %}
      {% comment %}{% include 'site-sidebar' %}{% endcomment %}

      <main class="page-content" role="main">
        <section class="blog-articles content-area">
          {% addbutton %}
          {% for article in articles %}
            {% include 'article-template' %}
          {% endfor %}
        </section>
      </main>

      {% include 'site-footer' %}
      {% include 'site-javascripts' %}
      <script>site.initBlogPage();</script>
    </div>
  </body>
</html>
