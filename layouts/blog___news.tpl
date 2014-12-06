<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include 'html-head' %}
  </head>

  <body class="blog-page">
    <div class="site-container">
      {% include 'site-header' %}

      {% include 'site-sidebar' %}

      <main class="page-content" role="main">
        <section class="blog-articles content-formatted">
          {% addbutton %}
          {% for article in articles %}
            {% include 'blog-article' %}
          {% endfor %}
        </section>
      </main>

      {% include 'site-footer' %}

      {% include 'site-javascripts' %}
      <script>site.initBlogPage();</script>
    </div>
  </body>
</html>
