<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "html-head" %}
  </head>

  <body class="front-page">
    <div class="site-container">
      {% include "site_header" %}

      {% include "site_sidebar" %}

        <main class="page-content content-formatted" role="main">{% content %}</main>
      </div>

      {% include "site_footer" %}

      {% include "site_javascripts" %}
      <script>site.initFrontPage();</script>
    </div>
  </body>
</html>
