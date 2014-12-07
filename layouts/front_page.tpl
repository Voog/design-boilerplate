<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include 'html-head' %}
  </head>

  <body class="front-page">
    <div class="site-container">
      {% include 'site-header' %}

      <main class="page-content" role="main">
        <header class="content-header content-formatted">{% contentblock name="content_header" %}<h1>{{ page.site_title }}</h1>{% endcontentblock %}</header>
        <div class="content-slogan content-formatted">{% content name="slogan" %}</div>
        <div class="content-body content-formatted">{% content %}</div>
      </main>

      {% include 'site-footer' %}

      {% include 'site-javascripts' %}
      <script>site.initFrontPage();</script>
    </div>
  </body>
</html>
