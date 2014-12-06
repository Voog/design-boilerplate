<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include 'html-head' %}
  </head>

  <body class="front-page">
    <div class="site-container">
      {% include 'site-header' %}

      {% include 'site-sidebar' %}

        <main class="page-content content-formatted" role="main">{% content %}</main>
      </div>

      {% include 'site-footer' %}

      {% include 'site-javascripts' %}
      <script>site.initFrontPage();</script>
    </div>
  </body>
</html>
