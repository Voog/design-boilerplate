<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "html-head" %}
  </head>

  <body class="common-page">
    <div class="site-container">
      {% include "site_header" %}

      {% include "site_sidebar" %}

      <main class="page-content content-formatted" role="main">{% content %}</main>

      {% include "site_footer" %}

      {% include "site_javascripts" %}
      <script>site.initCommonPage();</script>
    </div>
  </body>
</html>
